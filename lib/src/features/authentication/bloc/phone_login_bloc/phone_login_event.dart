part of 'phone_login_bloc.dart';

sealed class PhoneLoginEvent {
  const PhoneLoginEvent();

  const factory PhoneLoginEvent.login(
    String phone,
    String verificationCode,
  ) = _LoginWithPhoneEvent;
}

class _LoginWithPhoneEvent extends PhoneLoginEvent {
  final String phone;
  final String verificationCode;

  const _LoginWithPhoneEvent(this.phone, this.verificationCode);
}
