import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/common/apply_tag.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/desk_top_view.dart/icon_button.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/common/stat_box.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/common/status_pill.dart';
import 'package:flutter/material.dart';


class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
    required this.coupon,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  final CouponModel coupon;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.07),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    coupon.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CouponStatusPill(isActive: coupon.isActive),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.sellerBg,
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: AppColors.sellerBorder, width: 0.5),
                    ),
                    child: Text(
                      coupon.code,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                CouponIconBtn(
                  icon: Icons.copy_outlined,
                  color: AppColors.sellerWhite54,
                  onTap: () {}, // copy handled by caller if needed
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CouponStatBox(
                    label: 'Discount', value: '${coupon.discountPercent}%'),
                const SizedBox(width: 8),
                CouponStatBox(
                    label: 'Max off', value: '₹${coupon.maxDiscount}'),
              ],
            ),
            const Spacer(),
            Divider(color: AppColors.sellerBg, height: 1),
            const SizedBox(height: 10),
            Row(
              children: [
                CouponApplyTag(coupon.applyType),
                const Spacer(),
                CouponIconBtn(
                  icon: Icons.edit_outlined,
                  color: AppColors.sellerWhite54,
                  onTap: onEdit,
                ),
                const SizedBox(width: 6),
                CouponIconBtn(
                  icon: Icons.delete_outline,
                  color: AppColors.danger,
                  isDestructive: true,
                  onTap: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
