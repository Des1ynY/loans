part of '../passport_verification_form.dart';

class _IssuePlaceIdField extends StatelessWidget {
  const _IssuePlaceIdField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.passport_verification_issue_place_id,
      hintText: context.locales.passport_verification_issue_place_id_hint,
    );
  }
}
