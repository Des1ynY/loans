import 'package:flutter/widgets.dart';
import 'package:loans/src/features/verification/widgets/date_picker_field.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

part 'fields/issue_date_field.dart';
part 'fields/issue_place_field.dart';
part 'fields/issue_place_id_field.dart';
part 'fields/series_field.dart';

class PassportVerificationForm extends StatefulWidget {
  const PassportVerificationForm({super.key});

  @override
  State<PassportVerificationForm> createState() => _PassportVerificationFormState();
}

class _PassportVerificationFormState extends State<PassportVerificationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SeriesField(),
          SizedBox(height: kSpacingXL),
          _IssueDateField(),
          SizedBox(height: kSpacingXL),
          _IssuePlaceIdField(),
          SizedBox(height: kSpacingXL),
          _IssuePlaceField(),
        ],
      ),
    );
  }
}
