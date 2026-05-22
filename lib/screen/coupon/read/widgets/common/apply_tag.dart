
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponApplyTag extends StatelessWidget {
  const CouponApplyTag(this.type, {super.key});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color:        AppColors.sellerBg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.1),
          width: 0.5,
        ),
      ),
      child: Text(
        type,
        style: TextStyle(
          color:    AppColors.white.withValues(alpha: 0.45),
          fontSize: 11,
        ),
      ),
    );
  }
}
