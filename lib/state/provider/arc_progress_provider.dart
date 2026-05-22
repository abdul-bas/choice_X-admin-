
import 'dart:async';

import 'package:flutter/material.dart';

class ArcProgressProvider extends ChangeNotifier {
  double _revenueProgress = 0;
  double _activeUsersProgress = 0;
  double _conversionProgress = 0;
  double _totalOrdersProgress = 0;

  double get revenueProgress => _revenueProgress;
  double get activeUsersProgress => _activeUsersProgress;
  double get conversionProgress => _conversionProgress;
  double get totalOrdersProgress => _totalOrdersProgress;

  final Map<String, Timer> _timers = {};

  void startAnimation({
    required String key,
    required double target,
    Duration duration = const Duration(seconds: 3),
  }) {
    _timers[key]?.cancel();
    _setProgressByKey(key, 0);
    notifyListeners();

    const int steps = 60;
    final double stepValue = target / steps;
    final int stepTime = (duration.inMilliseconds / steps).round();

    _timers[key] = Timer.periodic(Duration(milliseconds: stepTime), (timer) {
      double current = _getProgressByKey(key);

      if (current >= target) {
        _setProgressByKey(key, target);
        timer.cancel();
        _timers.remove(key);
      } else {
        current += stepValue;
        if (current > target) {
          current = target;
        }
        _setProgressByKey(key, current);
      }

      notifyListeners();
    });
  }

  double _getProgressByKey(String key) {
    switch (key) {
      case 'revenue':
        return _revenueProgress;
      case 'activeUsers':
        return _activeUsersProgress;
      case 'activeSellers':
        return _conversionProgress;
      case 'totalOrders':
        return _totalOrdersProgress;
      default:
        return 0;
    }
  }

  void _setProgressByKey(String key, double value) {
    final newValue = value.clamp(0.0, 100.0);

    switch (key) {
      case 'revenue':
        _revenueProgress = newValue;
        break;
      case 'activeUsers':
        _activeUsersProgress = newValue;
        break;
      case 'activeSellers':
        _conversionProgress = newValue;
        break;
      case 'totalOrders':
        _totalOrdersProgress = newValue;
        break;
    }
  }

  @override
  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    super.dispose();
  }
}