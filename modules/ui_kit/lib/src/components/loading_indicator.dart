import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double size;
  final double strokeWidth;

  const LoadingIndicator({
    this.color,
    this.size = LoadingIndicator.defaultSize,
    this.strokeWidth = LoadingIndicator.defaultStrokeWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }

  static const defaultSize = 24.0;
  static const defaultStrokeWidth = 4.0;
}
