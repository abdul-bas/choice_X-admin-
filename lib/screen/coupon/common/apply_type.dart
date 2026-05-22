
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/common/app_widgets/form_section.dart';
import 'package:choice_x_admin/state/provider/coupon_form_provider.dart';
import 'package:flutter/material.dart';




class CouponApplyTypeSection extends StatelessWidget {
  const CouponApplyTypeSection({super.key, required this.provider});
  final CouponFormProvider provider;

  static const _types = ['all', 'category', 'brand'];

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Apply type',
      child: Row(
        children: _types
            .map((type) {
           final selected=   provider.applyType == type;
             return GestureDetector(
      onTap:()=> provider.setApplyType(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin:   const EdgeInsets.only(right: 8),
        padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.grey900
              : AppColors.sellerBg,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected
                ? AppColors.white.withValues(alpha: 0.3)
                : AppColors.sellerBorder,
            width: 0.5,
          ),
        ),
        child: Text(
          type[0].toUpperCase() + type.substring(1),
          style: TextStyle(
            color: selected
                ? AppColors.white
                : AppColors.white.withValues(alpha: 0.45),
            fontSize:   13,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
            } )
            .toList(),
      ),
    );
  }
}

