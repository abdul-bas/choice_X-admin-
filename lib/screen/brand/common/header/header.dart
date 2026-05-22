

import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class BrandHeader extends StatelessWidget {
  const BrandHeader({
    super.key,
    this.title    = 'Add Brand',
    this.subtitle = 'Upload a logo and enter the brand name.',
    this.icon     = Icons.diamond_outlined,
  });

  final String  title;
  final String  subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.brand.withValues(alpha: 0.25),
              width: 0.5,
            ),
          ),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
