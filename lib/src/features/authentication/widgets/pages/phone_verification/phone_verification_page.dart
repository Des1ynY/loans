import 'package:flutter/material.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/widgets/code_input_field.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/widgets/page_title.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/widgets/resend_code_button.dart';
import 'package:ui_kit/ui_kit.dart' hide CodeInputField;

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kSpacingL),
        child: Column(
          children: [
            SizedBox(height: kSpacingXXXL),
            Padding(
              padding: EdgeInsets.all(kSpacingL),
              child: PhoneVerificationPageTitle(),
            ),
            SizedBox(height: kSpacingXL),
            CodeInputField(),
            Expanded(child: SizedBox()),
            ResendCodeButton(),
          ],
        ),
      ),
    );
  }
}
