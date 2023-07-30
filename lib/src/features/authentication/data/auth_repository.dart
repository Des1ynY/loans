import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepository implements IPhoneAuthRepository {
  final IPhoneAuthProvider _provider;
  final BehaviorSubject<User?> _userStateController;

  AuthRepository({
    required IPhoneAuthProvider provider,
  })  : _provider = provider,
        _userStateController = BehaviorSubject<User?>() {
    _userStateController.add(_provider.currentUser);
  }

  @override
  User? get currentUser => _userStateController.value;

  @override
  Stream<User?> get userState => _userStateController.stream;

  @override
  Future<void> sendVerificationCode(String phone) {
    return _provider.sendVerificationCode(phone);
  }

  @override
  Future<User> loginWithPhone(String phone, String verificationCode) {
    return _provider.loginWithPhone(phone, verificationCode);
  }

  @override
  Future<void> logout() {
    return _provider.logout();
  }
}
