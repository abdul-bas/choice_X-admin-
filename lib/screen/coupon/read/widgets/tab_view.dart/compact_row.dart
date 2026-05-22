import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/common/status_pill.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/tab_view.dart/text_icon_button.dart';
import 'package:flutter/material.dart';

class CouponCompactRow extends StatelessWidget {
  const CouponCompactRow({
    super.key,
    required this.coupon,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  final CouponModel  coupon;
  final int          index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final statusColor =
        coupon.isActive ? AppColors.sellerAccentGreen : AppColors.danger;

    return Container(
      margin: const EdgeInsets.symmetric(vertical:  3),
      decoration: BoxDecoration(
        color:        AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.07),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
      
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Row(
              children: [Container(
      width:  36,
      height: 36,
      decoration: BoxDecoration(
        color:        statusColor.withValues(alpha: coupon.isActive ? 0.1 : 0.08),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: statusColor.withValues(alpha: coupon.isActive ? 0.25 : 0.2),
          width: 0.5,
        ),
      ),
      child: Icon(Icons.local_offer_outlined, size: 16, color: statusColor),
    ),
               
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coupon.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color:      AppColors.white,
                          fontSize:   13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${coupon.discountPercent.toStringAsFixed(0)}% off'
                        '  ·  max ₹${coupon.maxDiscount.toStringAsFixed(0)}',
                        style: TextStyle(
                          color:    AppColors.white.withValues(alpha: 0.3),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                CouponStatusPill(isActive: coupon.isActive, small: true),
              ],
            ),
          ),

         
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: Row(
              children: [
                Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:        AppColors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.09),
          width: 0.5,
        ),
      ),
      child: Text(
        coupon.code,
        style: TextStyle(
          color:         AppColors.white.withValues(alpha: 0.7),
          fontSize:      11,
          fontWeight:    FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    ),
                const SizedBox(width: 6),Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:        AppColors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
      child: Text(
        coupon.applyType,
        style: TextStyle(
          color:    AppColors.white.withValues(alpha: 0.3),
          fontSize: 10,
        ),
      ),
    ),
            
                const Spacer(),
                CouponTextIconBtn(
                  label:       'Edit',
                  icon:        Icons.edit_outlined,
                  color:       AppColors.white.withValues(alpha: 0.45),
                  borderColor: AppColors.white.withValues(alpha: 0.08),
                  bgColor:     AppColors.white.withValues(alpha: 0.04),
                  onTap:       onEdit,
                ),
                const SizedBox(width: 6),
                CouponTextIconBtn(
                  label:       'Delete',
                  icon:        Icons.delete_outline_rounded,
                  color:       AppColors.danger,
                  borderColor: AppColors.danger.withValues(alpha: 0.2),
                  bgColor:     AppColors.danger.withValues(alpha: 0.07),
                  onTap:       onDelete,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

