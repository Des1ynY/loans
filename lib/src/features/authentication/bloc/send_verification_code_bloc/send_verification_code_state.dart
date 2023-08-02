// ignore_for_file: long-parameter-list, library_private_types_in_public_api, no-object-declaration

part of 'send_verification_code_bloc.dart';

typedef SendVerificationCodeStateMatch<T, S extends SendVerificationCodeState> = T Function(S);

sealed class SendVerificationCodeState {
  const SendVerificationCodeState();

  bool get isProcessing => this is _ProcessingState;

  T map<T>({
    required SendVerificationCodeStateMatch<T, _IdleState> idle,
    required SendVerificationCodeStateMatch<T, _ProcessingState> processing,
    required SendVerificationCodeStateMatch<T, _SuccessState> success,
    required SendVerificationCodeStateMatch<T, _ErrorState> error,
  }) {
    return switch (this) {
      final _IdleState state => idle(state),
      final _ProcessingState state => processing(state),
      final _SuccessState state => success(state),
      final _ErrorState state => error(state),
    };
  }

  T maybeMap<T>({
    required SendVerificationCodeStateMatch<T, SendVerificationCodeState> orElse,
    SendVerificationCodeStateMatch<T, _IdleState>? idle,
    SendVerificationCodeStateMatch<T, _ProcessingState>? processing,
    SendVerificationCodeStateMatch<T, _SuccessState>? success,
    SendVerificationCodeStateMatch<T, _ErrorState>? error,
  }) {
    return map(
      idle: idle ?? orElse,
      processing: processing ?? orElse,
      success: success ?? orElse,
      error: error ?? orElse,
    );
  }

  T? mapOrNull<T>({
    SendVerificationCodeStateMatch<T, _IdleState>? idle,
    SendVerificationCodeStateMatch<T, _ProcessingState>? processing,
    SendVerificationCodeStateMatch<T, _SuccessState>? success,
    SendVerificationCodeStateMatch<T, _ErrorState>? error,
  }) {
    return maybeMap(
      orElse: (_) => null,
      idle: idle,
      processing: processing,
      success: success,
      error: error,
    );
  }
}

class _IdleState extends SendVerificationCodeState {
  const _IdleState();
}

class _ProcessingState extends SendVerificationCodeState {
  const _ProcessingState();
}

class _SuccessState extends SendVerificationCodeState {
  final String phone;

  const _SuccessState({required this.phone});
}

class _ErrorState extends SendVerificationCodeState {
  final Object error;

  const _ErrorState({required this.error});
}
