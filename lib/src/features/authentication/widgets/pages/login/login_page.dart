import 'package:flutter/material.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page_scope.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/widgets/login_warning.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/widgets/page_title.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/widgets/phone_input_field.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/widgets/send_code_button.dart';
import 'package:ui_kit/spacing.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginPageScope(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kSpacingL),
            child: Column(
              children: [
                const SizedBox(height: kSpacingXL),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kSpacingL),
                  child: LoginPageTitle(),
                ),
                const SizedBox(height: kSpacingXL),
                PhoneInputField(controller: _phoneFieldController),
                const SizedBox(height: kSpacingL),
                SendCodeButton(
                  phoneFieldController: _phoneFieldController,
                  onPressed: () {},
                ),
                const Expanded(child: SizedBox()),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kSpacingL),
                  child: LoginWarning(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneFieldController.dispose();
    super.dispose();
  }
}
