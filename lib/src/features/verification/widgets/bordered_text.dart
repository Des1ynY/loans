import 'package:flutter/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

class BorderedText extends StatelessWidget {
  final String text;

  const BorderedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(kRadiusS),
        color: context.surfaceColors.secondary,
      ),
      child: Text(
        text,
        style: context.bodyStyles.m.copyWith(color: context.textColors.secondary),
      ),
    );
  }
}
