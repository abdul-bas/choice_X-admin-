
import 'package:choice_x_admin/core/constants/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';

class SellerTopBar extends StatelessWidget {
  const SellerTopBar({
    super.key,
    required this.label,
    required this.value,
    required this.footer,
    required this.icon,
    required this.accentColor,
    required this.isMobile,
  });

  final String   label;
  final String   value;
  final String   footer;
  final IconData icon;
  final Color    accentColor;
  final bool     isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isMobile ? AppColors.border : AppColors.border,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.15),
                    width: 0.5,
                  ),
                ),
                child: Icon(icon, size: 16, color: accentColor),
              ),
            ],
          ),

          Text(
            value,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1,
            ),
          ),
          const SizedBox(height: 5),

         
          Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: accentColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                footer,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
