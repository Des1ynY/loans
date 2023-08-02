// ignore_for_file: long-parameter-list, library_private_types_in_public_api, no-object-declaration

part of 'phone_login_bloc.dart';

typedef PhoneLoginStateMatch<T, S extends PhoneLoginState> = T Function(S);

sealed class PhoneLoginState {
  const PhoneLoginState();

  bool get isProcessing => this is _ProcessingState;

  T map<T>({
    required PhoneLoginStateMatch<T, _IdleState> idle,
    required PhoneLoginStateMatch<T, _ProcessingState> processing,
    required PhoneLoginStateMatch<T, _SuccessState> success,
    required PhoneLoginStateMatch<T, _ErrorState> error,
  }) {
    return switch (this) {
      final _IdleState state => idle(state),
      final _ProcessingState state => processing(state),
      final _SuccessState state => success(state),
      final _ErrorState state => error(state),
    };
  }

  T maybeMap<T>({
    required PhoneLoginStateMatch<T, PhoneLoginState> orElse,
    PhoneLoginStateMatch<T, _IdleState>? idle,
    PhoneLoginStateMatch<T, _ProcessingState>? processing,
    PhoneLoginStateMatch<T, _SuccessState>? success,
    PhoneLoginStateMatch<T, _ErrorState>? error,
  }) {
    return map(
      idle: idle ?? orElse,
      processing: processing ?? orElse,
      success: success ?? orElse,
      error: error ?? orElse,
    );
  }

  T? mapOrNull<T>({
    PhoneLoginStateMatch<T, _IdleState>? idle,
    PhoneLoginStateMatch<T, _ProcessingState>? processing,
    PhoneLoginStateMatch<T, _SuccessState>? success,
    PhoneLoginStateMatch<T, _ErrorState>? error,
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

class _IdleState extends PhoneLoginState {
  const _IdleState();
}

class _ProcessingState extends PhoneLoginState {
  const _ProcessingState();
}

class _SuccessState extends PhoneLoginState {
  final User user;

  const _SuccessState({required this.user});
}

class _ErrorState extends PhoneLoginState {
  final Object error;

  const _ErrorState({required this.error});
}
