import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const String _verificationIdKey = 'verification_id';

  static Future<void> saveVerificationId(String verificationId) async {
    await _storage.write(key: _verificationIdKey, value: verificationId);
  }

  static Future<String?> getVerificationId() async {
    return await _storage.read(key: _verificationIdKey);
  }

  static Future<void> deleteVerificationId() async {
    await _storage.delete(key: _verificationIdKey);
  }
}
