part of '../user_verification_form.dart';

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.user_verification_first_name,
      hintText: context.locales.user_verification_first_name_hint,
    );
  }
}
