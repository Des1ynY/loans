// ignore_for_file: library_private_types_in_public_api

part of 'auth_bloc.dart';

typedef AuthStateMatch<T, State extends AuthState> = T Function(State state);

sealed class AuthState {
  final User? user;

  const AuthState(this.user);

  factory AuthState.fromUser(User? user) {
    if (user == null) return const _Unauthenticated();

    return _Authenticated(user);
  }

  T map<T>({
    required AuthStateMatch<T, _Authenticated> authenticated,
    required AuthStateMatch<T, _Unauthenticated> unauthenticated,
  }) {
    return switch (this) {
      final _Authenticated state => authenticated(state),
      final _Unauthenticated state => unauthenticated(state),
    };
  }

  T maybeMap<T>({
    required AuthStateMatch<T, AuthState> orElse,
    AuthStateMatch<T, _Authenticated>? authenticated,
    AuthStateMatch<T, _Unauthenticated>? unauthenticated,
  }) {
    return map(
      authenticated: authenticated ?? orElse,
      unauthenticated: unauthenticated ?? orElse,
    );
  }

  T? mapOrNull<T>({
    AuthStateMatch<T, _Authenticated>? authenticated,
    AuthStateMatch<T, _Unauthenticated>? unauthenticated,
  }) {
    return maybeMap(
      authenticated: authenticated,
      unauthenticated: unauthenticated,
      orElse: (_) => null,
    );
  }
}

class _Authenticated extends AuthState {
  @override
  User get user => super.user!;

  const _Authenticated(User super.user);
}

class _Unauthenticated extends AuthState {
  const _Unauthenticated() : super(null);
}
