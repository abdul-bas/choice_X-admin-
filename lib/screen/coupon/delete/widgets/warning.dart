
  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponDeleteWarning extends StatelessWidget {
  const CouponDeleteWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color:        AppColors.danger.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.danger.withValues(alpha: 0.12),
          width: 0.5,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size:  14,
            color: AppColors.danger.withValues(alpha: 0.7),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Active orders using this coupon won\'t be affected, '
              'but new applications will fail.',
              style: TextStyle(
                color:    AppColors.danger.withValues(alpha: 0.7),
                fontSize: 11,
                height:   1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}