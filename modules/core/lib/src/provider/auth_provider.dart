import '../../core.dart';

abstract interface class IPhoneAuthProvider {
  Future<void> sendVerificationCode(String phone);

  Future<User> loginWithPhone(String phone, [String? verificationCode]);
}
