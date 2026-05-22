

  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class DeleteCouponHeader extends StatelessWidget {
  const DeleteCouponHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width:  44,
          height: 44,
          decoration: BoxDecoration(
            color:        AppColors.danger.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.danger.withValues(alpha: 0.25),
              width: 0.5,
            ),
          ),
          child: Icon(
            Icons.delete_outline_rounded,
            color: AppColors.danger,
            size:  20,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delete coupon?',
                style: TextStyle(
                  color:      AppColors.white,
                  fontSize:   16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'This action is permanent and cannot be undone.',
                style: TextStyle(
                  color:    AppColors.white.withValues(alpha: 0.4),
                  fontSize: 12,
                  height:   1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
