part of 'send_verification_code_bloc.dart';

sealed class SendVerificationCodeEvent {
  const SendVerificationCodeEvent();

  const factory SendVerificationCodeEvent.sendCode(String phone) = _SendCodeEvent;
}

class _SendCodeEvent extends SendVerificationCodeEvent {
  final String phone;

  const _SendCodeEvent(this.phone);
}
