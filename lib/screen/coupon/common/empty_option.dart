
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyOptions extends StatelessWidget {
  const EmptyOptions({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:   double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color:        AppColors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.07),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size:  24,
            color: AppColors.white.withValues(alpha: 0.2),
          ),
          const SizedBox(height: 6),
          Text(
            'No ${label.toLowerCase()} available',
            style: TextStyle(
              color:    AppColors.white.withValues(alpha: 0.3),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
