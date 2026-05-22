
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class ArcPainter extends CustomPainter {
  const ArcPainter({required this.progress, required this.color});

  final double progress;
  final Color  color;

  static const double _strokeWidth = 10.0;
  static const double _startAngle  = math.pi * 0.75;
  static const double _sweepAngle  = math.pi * 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 5;

    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      _startAngle,
      _sweepAngle,
      false,
      Paint()
        ..color       = AppColors.white.withValues(alpha: 0.07)
        ..style       = PaintingStyle.stroke
        ..strokeWidth = _strokeWidth
        ..strokeCap   = StrokeCap.round,
    );

    // Progress
    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        _startAngle,
        _sweepAngle * (progress / 100),
        false,
        Paint()
          ..color       = color
          ..style       = PaintingStyle.stroke
          ..strokeWidth = _strokeWidth
          ..strokeCap   = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(ArcPainter old) =>
      old.progress != progress || old.color != color;
}