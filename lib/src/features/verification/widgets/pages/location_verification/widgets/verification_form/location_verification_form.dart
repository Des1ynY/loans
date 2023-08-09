import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

part 'fields/current_location_field.dart';
part 'fields/registered_location_field.dart';

class LocationVerificationForm extends StatefulWidget {
  const LocationVerificationForm({super.key});

  @override
  State<LocationVerificationForm> createState() => _LocationVerificationFormState();
}

class _LocationVerificationFormState extends State<LocationVerificationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        children: [
          _RegisteredLocationField(),
          SizedBox(height: kSpacingXL),
          _CurrentLocationField(),
        ],
      ),
    );
  }
}
