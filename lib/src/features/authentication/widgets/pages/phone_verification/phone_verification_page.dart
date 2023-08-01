import 'package:flutter/material.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/widgets/page_title.dart';
import 'package:ui_kit/ui_kit.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phone;

  const PhoneVerificationPage({required this.phone, super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kSpacingL),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacingL),
              child: PhoneVerificationPageTitle(phone: widget.phone),
            ),
            const SizedBox(height: kSpacingXL),
            const CodeInputField(codeLength: 6),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
