abstract interface class IPhoneAuthProvider {
  Future<void> sendVerificationCode(String phone);

  Future<void> loginWithPhone(String phone, String verificationCode);
}
