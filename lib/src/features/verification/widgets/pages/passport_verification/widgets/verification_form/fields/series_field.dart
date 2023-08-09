part of '../passport_verification_form.dart';

class _SeriesField extends StatelessWidget {
  const _SeriesField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.passport_verification_series,
      hintText: context.locales.passport_verification_series_hint,
    );
  }
}
