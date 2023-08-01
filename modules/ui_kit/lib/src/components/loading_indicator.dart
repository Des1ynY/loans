import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double size;

  const LoadingIndicator({
    this.color,
    this.size = LoadingIndicator.defaultSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator.adaptive(backgroundColor: color),
    );
  }

  static const defaultSize = 24.0;
}
