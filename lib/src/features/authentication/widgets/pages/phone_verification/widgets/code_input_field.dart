import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/authentication/bloc/phone_login_bloc/phone_login_bloc.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page_scope.dart';
import 'package:ui_kit/components.dart';
import 'package:ui_kit/ui_kit.dart' as ui_kit;

class CodeInputField extends StatefulWidget {
  const CodeInputField({super.key});

  @override
  State<CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  final _codeFieldController = TextEditingController();
  final _codeFieldKey = GlobalKey<CodeInputFieldState>();

  void _loginWithPhone() {
    if (_codeFieldController.text.length < _codeLength) return;

    final phone = PhoneVerificationPageScope.phoneOf(context, listen: false);
    final verificationCode = _codeFieldController.text;

    PhoneVerificationPageScope.loginWithPhone(
      context,
      phone: phone,
      verificationCode: verificationCode,
    );
  }

  @override
  void initState() {
    super.initState();
    _codeFieldController.addListener(_loginWithPhone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneLoginBloc, PhoneLoginState>(
      bloc: PhoneVerificationPageScope.phoneLoginBlocOf(context),
      listener: (context, state) => state.mapOrNull(
        idle: (state) => _codeFieldKey.currentState
          ?..clear()
          ..requestFocus(),
      ),
      child: ui_kit.CodeInputField(
        codeLength: _codeLength,
        controller: _codeFieldController,
        inputAction: TextInputAction.done,
        keyboardType: TextInputType.number,
        autofocus: true,
        key: _codeFieldKey,
      ),
    );
  }

  @override
  void dispose() {
    _codeFieldController.dispose();
    super.dispose();
  }

  static const _codeLength = 6;
}
