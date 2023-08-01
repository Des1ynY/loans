import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:loans/src/features/authentication/data/auth_repository.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';

typedef _Emit = Emitter<PhoneLoginState>;

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  final AuthRepository _repository;

  PhoneLoginBloc({required AuthRepository repository})
      : _repository = repository,
        super(const _IdleState()) {
    on<PhoneLoginEvent>(
      (event, emit) => switch (event) {
        final _LoginWithPhoneEvent event => _login(event, emit),
      },
    );
  }

  Future<void> _login(_LoginWithPhoneEvent event, _Emit emit) async {
    emit(const _ProcessingState());

    try {
      final user = await _repository.loginWithPhone(event.phone, event.verificationCode);

      emit(_SuccessState(user: user));
    } on Object catch (e, st) {
      addError(e, st);
      emit(_ErrorState(error: e));
    } finally {
      emit(const _IdleState());
    }
  }
}
