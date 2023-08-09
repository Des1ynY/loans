import 'package:flutter/widgets.dart';
import 'package:loans/src/features/verification/widgets/date_picker_field.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

part 'fields/birth_place_field.dart';
part 'fields/first_name_field.dart';
part 'fields/gender_selector.dart';
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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LastNameField(),
          SizedBox(height: kSpacingXL),
          _FirstNameField(),
          SizedBox(height: kSpacingXL),
          _MiddleNameField(),
          SizedBox(height: kSpacingXL),
          _GenderSelector(),
          SizedBox(height: kSpacingXL),
          DatePickerField(),
          SizedBox(height: kSpacingXL),
          _BirthPlaceField(),
        ],
      ),
    );
  }
}
