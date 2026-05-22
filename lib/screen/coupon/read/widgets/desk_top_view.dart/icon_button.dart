
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
class CouponIconBtn extends StatelessWidget {
  const CouponIconBtn({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final Color    color;
  final VoidCallback onTap;

  
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:  30,
        height: 30,
        decoration: BoxDecoration(
          color:        AppColors.sellerBg,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: isDestructive
                ? AppColors.danger.withValues(alpha: 0.3)
                : AppColors.white.withValues(alpha: 0.08),
            width: 0.5,
          ),
        ),
        child: Icon(icon, size: 15, color: color),
      ),
    );
  }
}