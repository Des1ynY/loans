part of '../location_verification_form.dart';

class _CurrentLocationField extends StatelessWidget {
  const _CurrentLocationField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.location_verification_current,
      hintText: context.locales.location_verification_current_hint,
    );
  }
}
