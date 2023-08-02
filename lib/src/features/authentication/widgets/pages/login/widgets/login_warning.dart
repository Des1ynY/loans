import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/theme.dart';

class LoginWarning extends StatefulWidget {
  const LoginWarning({super.key});

  @override
  State<LoginWarning> createState() => _LoginWarningState();
}

class _LoginWarningState extends State<LoginWarning> {
  late List<InlineSpan> _spans;

  // TODO: implement _openOffer
  void _openOffer() {}

  // TODO: implement _openPrivacy
  void _openPrivacy() {}

  void _splitLoginWarning() {
    final warning = context.locales.login_warning;
    final offer = context.locales.login_warning_offer;
    final privacy = context.locales.login_warning_privacy;

    final offerStart = warning.indexOf(offer);
    final offerEnd = offerStart + offer.length;
    final privacyStart = warning.indexOf(privacy);
    final privacyEnd = privacyStart + privacy.length;

    final offerFirst = offerStart < privacyStart;

    final offerSpan = TextSpan(
      text: warning.substring(offerStart, offerEnd),
      style: context.bodyStyles.s.copyWith(color: context.textColors.link),
      recognizer: TapGestureRecognizer()..onTap = _openOffer,
    );
    final privacySpan = TextSpan(
      text: warning.substring(privacyStart, privacyEnd),
      style: context.bodyStyles.s.copyWith(color: context.textColors.link),
      recognizer: TapGestureRecognizer()..onTap = _openPrivacy,
    );

    final spans = <TextSpan>[
      TextSpan(
        text: warning.substring(0, offerFirst ? offerStart : privacyStart),
        style: context.bodyStyles.s.copyWith(color: context.textColors.primary),
      ),
      offerFirst ? offerSpan : privacySpan,
      TextSpan(
        text: warning.substring(
          offerFirst ? offerEnd : privacyEnd,
          offerFirst ? privacyStart : offerStart,
        ),
        style: context.bodyStyles.s.copyWith(color: context.textColors.primary),
      ),
      offerFirst ? privacySpan : offerSpan,
      TextSpan(
        text: warning.substring(
          offerFirst ? privacyEnd : offerEnd,
          warning.length,
        ),
        style: context.bodyStyles.s.copyWith(color: context.textColors.primary),
      ),
    ];

    setState(() => _spans = spans);
  }

  @override
  void didChangeDependencies() {
    _splitLoginWarning();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(children: _spans),
      textAlign: TextAlign.center,
    );
  }
}
