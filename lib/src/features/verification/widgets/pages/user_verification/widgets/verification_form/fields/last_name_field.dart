part of '../user_verification_form.dart';

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.user_verification_last_name,
      hintText: context.locales.user_verification_last_name_hint,
    );
  }
}
