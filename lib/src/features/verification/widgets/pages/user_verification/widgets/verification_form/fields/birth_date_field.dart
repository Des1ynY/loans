part of '../user_verification_form.dart';

class _BirthDateField extends StatelessWidget {
  const _BirthDateField();

  @override
  Widget build(BuildContext context) {
    return DatePickerField(label: context.locales.user_verification_birth_date);
  }
}
