part of '../user_verification_form.dart';

class _BirthPlaceField extends StatelessWidget {
  const _BirthPlaceField();

  @override
  Widget build(BuildContext context) {
    return TextInputField.labeled(
      label: context.locales.user_verification_birth_place,
      hintText: context.locales.user_verification_birth_place_hint,
    );
  }
}
