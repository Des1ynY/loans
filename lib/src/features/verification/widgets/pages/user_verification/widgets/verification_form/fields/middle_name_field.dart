part of '../user_verification_form.dart';

class _MiddleNameField extends StatelessWidget {
  const _MiddleNameField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.user_verification_middle_name,
      hintText: context.locales.user_verification_middle_name_hint,
    );
  }
}
