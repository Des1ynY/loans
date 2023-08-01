import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/authentication/bloc/send_verification_code_bloc/send_verification_code_bloc.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page_scope.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/utils/phone_formatter.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class SendCodeButton extends StatefulWidget {
  final TextEditingController phoneFieldController;
  final VoidCallback? onPressed;

  const SendCodeButton({
    required this.phoneFieldController,
    this.onPressed,
    super.key,
  });

  @override
  State<SendCodeButton> createState() => _SendCodeButtonState();
}

class _SendCodeButtonState extends State<SendCodeButton> {
  bool _hasValidPhone = false;

  void _validatePhone() {
    final phone = widget.phoneFieldController.text;
    final isValidPhone = PhoneFormatter.validateNumber(phone);

    if (_hasValidPhone != isValidPhone) setState(() => _hasValidPhone = isValidPhone);
  }

  @override
  void initState() {
    super.initState();
    widget.phoneFieldController.addListener(_validatePhone);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendVerificationCodeBloc, SendVerificationCodeState>(
      bloc: LoginPageScope.sendVerificationCodeBlocOf(context),
      builder: (context, state) => AbsorbPointer(
        absorbing: state.isProcessing,
        child: Button.large(
          onPressed: _hasValidPhone ? widget.onPressed : null,
          caption: !state.isProcessing ? context.locales.send_code_button : null,
          leading: state.isProcessing
              ? LoadingIndicator(size: 18, color: context.surfaceColors.primary)
              : null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.phoneFieldController.removeListener(_validatePhone);
    super.dispose();
  }
}
