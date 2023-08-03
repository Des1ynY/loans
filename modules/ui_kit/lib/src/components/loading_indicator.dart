import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/theme.dart';

class LoadingIndicator extends StatefulWidget {
  final Color? foregroundColor;
  final Color? backgroundColor;

  final double size;
  final double strokeWidth;

  final Duration repeatDuration;

  const LoadingIndicator({
    this.foregroundColor,
    this.backgroundColor,
    this.size = LoadingIndicator.defaultSize,
    this.strokeWidth = LoadingIndicator.defaultStrokeWidth,
    this.repeatDuration = LoadingIndicator.defaultRepeatDuration,
    super.key,
  });

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();

  static const defaultSize = 24.0;
  static const defaultStrokeWidth = 4.0;
  static const defaultRepeatDuration = Duration(seconds: 2);
}

class _LoadingIndicatorState extends State<LoadingIndicator> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: widget.repeatDuration ~/ 2,
    vsync: this,
  );

  bool get _invertColors => _controller.status == AnimationStatus.reverse;

  double get _progressValue {
    if (_invertColors) return 1 - _controller.value;

    return _controller.value;
  }

  @override
  void initState() {
    super.initState();
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ListenableBuilder(
        listenable: _controller.view,
        builder: (context, child) => SizedBox.square(
          dimension: widget.size,
          child: CustomPaint(
            painter: _LoadingIndicatorPainter(
              progress: _progressValue,
              foregroundColor: widget.foregroundColor ?? context.surfaceColors.invert,
              backgroundColor: widget.backgroundColor ?? context.surfaceColors.secondary,
              strokeWidth: widget.strokeWidth,
              invertColors: _invertColors,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _LoadingIndicatorPainter extends CustomPainter {
  final double progress;

  final Color backgroundColor;
  final Color foregroundColor;

  final double strokeWidth;
  final bool invertColors;

  _LoadingIndicatorPainter({
    required this.progress,
    required this.backgroundColor,
    required this.foregroundColor,
    this.strokeWidth = LoadingIndicator.defaultStrokeWidth,
    this.invertColors = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width / 2;
    final radius = min(size.width / 2, size.height / 2);

    // Draw the circle
    final backgroundPaint = Paint()
      ..color = invertColors ? foregroundColor : backgroundColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(center, center),
      radius,
      backgroundPaint,
    );

    // Draw the progress arc
    final angle = 2 * pi * progress;
    final foregroundPaint = Paint()
      ..color = invertColors ? backgroundColor : foregroundColor
      ..strokeWidth = strokeWidth + 0.2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(center, center), radius: radius),
      -pi / 2,
      angle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _LoadingIndicatorPainter oldDelegate) => true;
}
