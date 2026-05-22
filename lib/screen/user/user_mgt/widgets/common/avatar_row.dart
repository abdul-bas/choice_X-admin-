
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, 
    required this.name,
    required this.color,
    required this.size,
    required this.radius,
  });

  final String name;
  final Color color;
  final double size;
  final double radius;

  String get _initials => name
      .trim()
      .split(' ')
      .take(2)
      .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
      .join();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: color.withValues(alpha: 0.22),
          width: 0.5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(_initials,
          style: TextStyle(
              color: color,
              fontSize: size * 0.3,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.5)),
    );
  }
}