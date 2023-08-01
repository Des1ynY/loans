import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:loans/src/features/authentication/data/auth_repository.dart';

part 'send_verification_code_event.dart';
part 'send_verification_code_state.dart';

typedef _Emit = Emitter<SendVerificationCodeState>;

class SendVerificationCodeBloc extends Bloc<SendVerificationCodeEvent, SendVerificationCodeState> {
  final AuthRepository _repository;

  SendVerificationCodeBloc({required AuthRepository repository})
      : _repository = repository,
        super(const _IdleState()) {
    on<SendVerificationCodeEvent>(
      (event, emit) => switch (event) {
        final _SendCodeEvent event => _sendCode(event, emit),
      },
      transformer: droppable(),
    );
  }

  Future<void> _sendCode(_SendCodeEvent event, _Emit emit) async {
    emit(const _ProcessingState());

    try {
      await _repository.sendVerificationCode(event.phone);

      emit(_SuccessState(phone: event.phone));
    } on Object catch (e, st) {
      addError(e, st);
      emit(_ErrorState(error: e));
    } finally {
      emit(const _IdleState());
    }
  }
}
