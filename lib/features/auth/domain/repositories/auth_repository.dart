import '../models/user_model.dart';
import '../models/auth_state.dart';

abstract class AuthRepository {
  Future<void> sendOTP(String phoneNumber);
  Future<UserModel> verifyOTP({
    required String phoneNumber,
    required String otp,
    required String name,
  });
  Future<UserModel?> getCurrentUser();
  Future<void> signOut();
}
