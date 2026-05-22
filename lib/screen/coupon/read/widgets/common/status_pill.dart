
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponStatusPill extends StatelessWidget {
  const CouponStatusPill({super.key, required this.isActive, this.small = false});

  final bool isActive;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.sellerAccentGreen : AppColors.danger;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 7 : 9,
        vertical:   small ? 2 : 3,
      ),
      decoration: BoxDecoration(
        color:        color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: TextStyle(
          color:      color,
          fontSize:   small ? 10 : 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}