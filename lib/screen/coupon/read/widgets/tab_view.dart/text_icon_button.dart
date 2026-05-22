
import 'package:flutter/material.dart';


class CouponTextIconBtn extends StatelessWidget {
  const CouponTextIconBtn({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    required this.borderColor,
    required this.bgColor,
    required this.onTap,
  });

  final String       label;
  final IconData     icon;
  final Color        color;
  final Color        borderColor;
  final Color        bgColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:  28,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color:        bgColor,
          borderRadius: BorderRadius.circular(7),
          border:       Border.all(color: borderColor, width: 0.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: color),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color:      color,
                fontSize:   11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}