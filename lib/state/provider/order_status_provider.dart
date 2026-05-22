import 'dart:async';

import 'package:flutter/material.dart';
class OrderStatusProvider extends ChangeNotifier {
  final Map<String, double> _animated = {};
  final Map<String, Timer>  _timers   = {};

  double getValue(String key) => _animated[key] ?? 0;

  void setTargets(Map<String, double> targets) {
    for (final entry in targets.entries) {
      _startAnimation(entry.key, entry.value);
    }
  }

  void _startAnimation(String key, double target) {
    _timers[key]?.cancel();
    _animated[key] = 0;
    notifyListeners();

    if (target <= 0) return;

    const steps = 40;
    final stepValue = target / steps;

    _timers[key] = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      double current = (_animated[key] ?? 0) + stepValue;
      if (current >= target) {
        current = target;
        timer.cancel();
        _timers.remove(key);
      }
      _animated[key] = current;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    for (final t in _timers.values) t.cancel();
    super.dispose();
  }
}