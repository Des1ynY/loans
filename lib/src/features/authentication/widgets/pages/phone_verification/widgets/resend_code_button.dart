import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:loans/src/shared/utils/countdown_timer.dart';
import 'package:ui_kit/ui_kit.dart';

class ResendCodeButton extends StatefulWidget {
  final String phone;

  const ResendCodeButton({required this.phone, super.key});

  @override
  State<ResendCodeButton> createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  final _countdown = CountdownTimer(duration: const Duration(seconds: 90));
  bool _resendAvailable = false;

  void _resendVerificationCode() {}

  void _updateOnTick() {
    final hasEnded = _countdown.timeLeft == Duration.zero;

    setState(() => _resendAvailable = hasEnded);
  }

  @override
  void initState() {
    super.initState();
    _countdown.addListener(_updateOnTick);
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
            TextSpan(
              text: context.locales.resend_code_countdown(_countdown.timeLeft.inSeconds),
              style: TextStyle(
                color: context.textColors.link.withAlpha(context.textColors.link.alpha ~/ 2),
              ),
            ),
          ]
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countdown.dispose();
    super.dispose();
  }
}
