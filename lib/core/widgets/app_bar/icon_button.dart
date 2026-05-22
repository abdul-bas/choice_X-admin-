
import 'package:flutter/material.dart';

class AppBarIconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const AppBarIconBtn(
      {super.key, required this.icon, required this.onTap, this.size = 17});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha:  0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: Colors.white.withValues(alpha:  0.09), width: 0.5),
        ),
        child: Icon(icon, size: size,
            color: Colors.white.withValues(alpha:  0.5)),
      ),
    );
  }
}
