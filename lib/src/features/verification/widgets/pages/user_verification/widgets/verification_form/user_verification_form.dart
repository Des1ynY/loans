import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

part 'fields/birth_place_field.dart';
part 'fields/first_name_field.dart';
part 'fields/last_name_field.dart';
part 'fields/middle_name_field.dart';

class UserVerificationForm extends StatefulWidget {
  const UserVerificationForm({super.key});

  @override
  State<UserVerificationForm> createState() => _UserVerificationFormState();
}

class _UserVerificationFormState extends State<UserVerificationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        children: [
          _LastNameField(),
          SizedBox(height: kSpacingXL),
          _FirstNameField(),
          SizedBox(height: kSpacingXL),
          _MiddleNameField(),
          SizedBox(height: kSpacingXL),
          _BirthPlaceField(),
        ],
      ),
    );
  }
}
