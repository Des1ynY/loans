import 'dart:async';

import 'package:flutter/foundation.dart';

class CountdownTimer with ChangeNotifier {
  final Duration duration;
  final Duration tickStep;

  Timer? _timer;
  Duration _timeLeft;

  CountdownTimer({
    required this.duration,
    this.tickStep = const Duration(seconds: 1),
  }) : _timeLeft = duration;

  Duration get timeLeft => _timeLeft.isNegative ? Duration.zero : _timeLeft;

  void start() {
    if (_timeLeft.isNegative) restart();

    _timer = Timer.periodic(tickStep, (timer) {
      _timeLeft -= tickStep;

      if (_timeLeft.isNegative) _timer?.cancel();

      notifyListeners();
    });

    notifyListeners();
  }

  void restart() {
    _timer?.cancel();
    _timeLeft = duration;

    start();
  }

  void stop() {
    _timer?.cancel();

    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
