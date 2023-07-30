import '../entity/user.dart';

abstract interface class IAuthRepository {
  User? get currentUser;

  Stream<User?> get userState;

  Future<void> logout();
}

abstract interface class IPhoneAuthRepository extends IAuthRepository {
  Future<void> sendVerificationCode(String phone);

  Future<User> loginWithPhone(String phone, String verificationCode);
}
