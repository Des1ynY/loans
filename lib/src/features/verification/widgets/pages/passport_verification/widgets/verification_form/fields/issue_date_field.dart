part of '../passport_verification_form.dart';

class _IssueDateField extends StatelessWidget {
  const _IssueDateField();

  @override
  Widget build(BuildContext context) {
    return DatePickerField(label: context.locales.passport_verification_issue_date);
  }
}
