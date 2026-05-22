
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
class CouponStatBox extends StatelessWidget {
  const CouponStatBox({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color:        AppColors.sellerBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: TextStyle(
                color:    AppColors.white.withValues(alpha: 0.35),
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: const TextStyle(
                color:      AppColors.white,
                fontSize:   16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
