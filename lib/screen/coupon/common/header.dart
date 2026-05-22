
  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddCouponHeader extends StatelessWidget {
  const AddCouponHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'New Coupon',
          style: TextStyle(
            color:      AppColors.white,
            fontSize:   20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Fill in the details to create a discount coupon.',
          style: TextStyle(
            color:    AppColors.white.withValues(alpha: 0.4),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
