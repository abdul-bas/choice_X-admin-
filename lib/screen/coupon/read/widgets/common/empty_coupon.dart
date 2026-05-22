
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyCoupons extends StatelessWidget {
  const EmptyCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No coupons found',
        style: TextStyle(color: AppColors.sellerWhite54, fontSize: 16),
      ),
    );
  }
}
