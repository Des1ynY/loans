part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();

  const factory AuthEvent.login(User user) = _LoginEvent;

  const factory AuthEvent.logout() = _LogoutEvent;
}

class _LoginEvent extends AuthEvent {
  final User user;

  const _LoginEvent(this.user);
}

class _LogoutEvent extends AuthEvent {
  const _LogoutEvent();
}
