import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotelanchor/features/auth/domain/models/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../core/services/secure_storage_service.dart';
import '../../../../core/constants/error_constants.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;
  final SupabaseClient _supabase;

  AuthRepositoryImpl({FirebaseAuth? auth, SupabaseClient? supabase})
    : _auth = auth ?? FirebaseAuth.instance,
      _supabase = supabase ?? Supabase.instance.client;

  String _formatPhoneNumber(String phoneNumber) {
    if (!phoneNumber.startsWith('+')) {
      return '+91$phoneNumber';
    }
    return phoneNumber;
  }

  @override
  Future<void> sendOTP(String phoneNumber) async {
    try {
      final formattedPhone = _formatPhoneNumber(phoneNumber);

      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-verification (mainly for Android)
          await _handleCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          String message = 'Verification failed';
          switch (e.code) {
            case 'invalid-phone-number':
              message = 'The phone number provided is invalid';
              break;
            case 'too-many-requests':
              message = 'Too many attempts. Please try again later';
              break;
            case 'operation-not-allowed':
              message = 'Phone authentication is not enabled';
              break;
          }
          throw Exception(message);
        },
        codeSent: (String verificationId, int? resendToken) async {
          // Store verification ID securely
          await SecureStorageService.saveVerificationId(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle timeout
        },
      );
    } catch (e) {
      throw Exception('Failed to send OTP: ${e.toString()}');
    }
  }

  Future<UserCredential> _handleCredential(
    PhoneAuthCredential credential,
  ) async {
    try {
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception('Authentication failed: ${e.message}');
    }
  }

  @override
  Future<UserModel> verifyOTP({
    required String phoneNumber,
    required String otp,
    required String name,
  }) async {
    try {
      final verificationId = await SecureStorageService.getVerificationId();
      if (verificationId == null) {
        throw Exception(AuthErrorMessages.otpExpired);
      }

      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );

      final userCredential = await _handleCredential(credential);
      final firebaseUser = userCredential.user;

      if (firebaseUser == null) {
        throw Exception(AuthErrorMessages.unknownError);
      }

      try {
        // Store user data in Supabase
        final userData =
            await _supabase
                .from('users')
                .upsert({
                  'id': firebaseUser.uid,
                  'phone_number': phoneNumber,
                  'name': name,
                  'updated_at': DateTime.now().toIso8601String(),
                })
                .select()
                .single();

        // Clean up
        await SecureStorageService.deleteVerificationId();

        return UserModel.fromJson(userData);
      } catch (e) {
        // If Supabase fails, still return basic user data
        return UserModel(
          id: firebaseUser.uid,
          phoneNumber: phoneNumber,
          name: name,
          updatedAt: DateTime.now(),
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    try {
      // Get user profile from Supabase
      final userData =
          await _supabase.from('users').select().eq('id', user.uid).single();

      return UserModel.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Helper methods for user profile
  Future<void> saveUserProfile({
    required String userId,
    required String phoneNumber,
    required String name,
  }) async {
    // TODO: Implement saving user profile to your database
  }

  // Future<UserProfile> getUserProfile(String userId) async {
  //   // TODO: Implement getting user profile from your database
  //   throw UnimplementedError();
  // }
}
