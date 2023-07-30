import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart' as api;

typedef VerificationIdStorage = Map<String, String>;
typedef ResendTokenStorage = Map<String, int?>;

final class PhoneAuthProvider implements IPhoneAuthProvider {
  final api.FirebaseAuth _auth;
  final VerificationIdStorage _verificationIdStorage;
  final ResendTokenStorage _resendTokenStorage;

  PhoneAuthProvider({api.FirebaseAuth? auth})
      : _auth = auth ?? api.FirebaseAuth.instance,
        _verificationIdStorage = <String, String>{},
        _resendTokenStorage = <String, int?>{};

  @override
  User? get currentUser {
    final apiUser = _auth.currentUser;

    if (apiUser == null) return null;

    return User(apiUser.uid);
  }

  @override
  Future<void> sendVerificationCode(String phone) {
    final resendToken = _resendTokenStorage[phone];

    return _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: Duration.zero,
      forceResendingToken: resendToken,
      verificationCompleted: (credential) {},
      codeAutoRetrievalTimeout: (verificationId) {},
      verificationFailed: (error) => throw error,
      codeSent: (verificationId, resendingToken) {
        _verificationIdStorage[phone] = verificationId;
        _resendTokenStorage[phone] = resendingToken;
      },
    );
  }

  @override
  Future<User> loginWithPhone(String phone, [String? verificationCode]) async {
    final verificationId = _verificationIdStorage[phone];

    if (verificationId == null) throw api.FirebaseAuthException(code: 'invalid-verification-id');
    if (verificationCode == null) {
      throw api.FirebaseAuthException(code: 'invalid-verification-code');
    }

    final phoneAuthCredential = api.PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    final userCredential = await _auth.signInWithCredential(phoneAuthCredential);
    final userData = userCredential.user;

    if (userData == null) throw api.FirebaseAuthException(code: 'invalid-credential');

    return User(userData.uid);
  }

  @override
  Future<void> logout() {
    return _auth.signOut();
  }
}
