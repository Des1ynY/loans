import 'package:bloc/bloc.dart';
import 'package:core/core.dart';

part 'auth_event.dart';
part 'auth_state.dart';

typedef _Emit = Emitter<AuthState>;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required User? initialUser}) : super(AuthState.fromUser(initialUser)) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        final _LoginEvent event => _login(event, emit),
        final _LogoutEvent event => _logout(event, emit),
      },
    );
  }

  void _login(_LoginEvent event, _Emit emit) => emit(_Authenticated(event.user));

  void _logout(_LogoutEvent event, _Emit emit) => emit(const _Unauthenticated());
}
