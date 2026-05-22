

import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponPreviewRow extends StatelessWidget {
  const CouponPreviewRow({super.key, required this.couponName});
  final String couponName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:   double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color:        AppColors.sellerBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder, width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            width:  30,
            height: 30,
            decoration: BoxDecoration(
              color:        AppColors.danger.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.local_offer_outlined,
              color: AppColors.danger,
              size:  15,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              couponName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color:      AppColors.white,
                fontSize:   13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color:        AppColors.danger.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Will be deleted',
              style: TextStyle(
                color:      AppColors.danger.withValues(alpha: 0.7),
                fontSize:   10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
