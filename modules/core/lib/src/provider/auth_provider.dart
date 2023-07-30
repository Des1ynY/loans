import '../../core.dart';

abstract interface class IPhoneAuthProvider {
  User? get currentUser;

  Future<void> sendVerificationCode(String phone);

  Future<User> loginWithPhone(String phone, [String? verificationCode]);

  Future<void> logout();
}
