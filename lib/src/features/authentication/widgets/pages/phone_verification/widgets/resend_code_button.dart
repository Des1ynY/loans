import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loans/src/features/authentication/bloc/send_verification_code_bloc/send_verification_code_bloc.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page_scope.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:loans/src/shared/utils/countdown_timer.dart';
import 'package:ui_kit/ui_kit.dart';

class ResendCodeButton extends StatefulWidget {
  const ResendCodeButton({super.key});

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  final _countdown = CountdownTimer(duration: const Duration(seconds: 90));
  bool _resendAvailable = false;

  void _resendVerificationCode() {
    final phone = PhoneVerificationPageScope.phoneOf(context, listen: false);

    PhoneVerificationPageScope.sendVerificationCode(context, phone);
    _countdown.restart();
  }

  void _updateOnTick() {
    final hasEnded = _countdown.timeLeft == Duration.zero;

    setState(() => _resendAvailable = hasEnded);
  }

  @override
  void initState() {
    super.initState();
    _countdown
      ..addListener(_updateOnTick)
      ..start();
  }

  @override
  Widget build(BuildContext context) {
    final unavailableColor = context.textColors.link.withAlpha(context.textColors.link.alpha ~/ 2);

    return BlocBuilder<SendVerificationCodeBloc, SendVerificationCodeState>(
      bloc: PhoneVerificationPageScope.sendVerificationCodeBlocOf(context),
      builder: (context, state) => Text.rich(
        TextSpan(
          text: context.locales.resend_code_button + ' ',
          style: context.bodyStyles.s.copyWith(color: context.textColors.primary),
          children: [
            if (_resendAvailable) ...[
              TextSpan(
                text: context.locales.resend_code_request,
                style: TextStyle(color: context.textColors.link),
                recognizer: TapGestureRecognizer()..onTap = _resendVerificationCode,
              )
            ] else ...[
              if (state.isProcessing) ...[
                WidgetSpan(child: LoadingIndicator(size: 18, color: unavailableColor)),
              ] else ...[
                TextSpan(
                  text: context.locales.resend_code_countdown(_countdown.timeLeft.inSeconds),
                  style: TextStyle(color: unavailableColor),
                ),
              ]
            ]
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _countdown.dispose();
    super.dispose();
  }
}
