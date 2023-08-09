part of '../location_verification_form.dart';

class _RegisteredLocationField extends StatelessWidget {
  const _RegisteredLocationField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.location_verification_registration,
      hintText: context.locales.location_verification_registration_hint,
    );
  }
}
