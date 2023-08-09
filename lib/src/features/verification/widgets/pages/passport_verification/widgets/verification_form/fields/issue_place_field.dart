part of '../passport_verification_form.dart';

class _IssuePlaceField extends StatelessWidget {
  const _IssuePlaceField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.passport_verification_issue_place,
      hintText: context.locales.passport_verification_issue_place_hint,
    );
  }
}
