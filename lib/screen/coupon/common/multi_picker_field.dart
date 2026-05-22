import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/coupon/common/empty_option.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'form_label.dart';

class MultiPickerField extends StatelessWidget {
  const MultiPickerField({
    super.key,
    required this.label,
    required this.available,
    required this.selected,
    required this.onToggle,
  });

  final String label;
  final List<String> available;
  final List<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            FormLabel(label),
            if (selected.isNotEmpty) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$count selected',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        available.isEmpty
            ? EmptyOptions(label: label)
            : Wrap(
                spacing: 8,
                runSpacing: 8,
                children: available.map((item) {
                  final isSelected = selected.contains(item);
                  return GestureDetector(
                    onTap:()=>  onToggle(item),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.brand.withValues(alpha: 0.12)
                            : AppColors.sellerBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.brand.withValues(alpha: 0.4)
                              : AppColors.white.withValues(alpha: 0.08),
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width:  14,
      height: 14,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.brand : AppColors.sellerSurfaceInput,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected
              ? AppColors.brand
              : AppColors.white.withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: isSelected
          ? const Icon(Icons.check_rounded, size: 10, color: AppColors.white)
          : null,
    ),
                          const SizedBox(width: 8),
                          Text(
                            item,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.white.withValues(alpha: 0.55),
                              fontSize: 13,
                              fontWeight: isSelected
                                  ? FontWeight.w500
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
        if (selected.isNotEmpty) ...[
          const SizedBox(height: 12),
          Container(
      width:   double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:        AppColors.sellerBg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.07),
          width: 0.5,
        ),
      ),
      child: Wrap(
        spacing:    6,
        runSpacing: 6,
        children: selected.map((item) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color:        AppColors.brand.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.brand.withValues(alpha: 0.3),
          width: 0.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item,
            style: TextStyle(
              color:      AppColors.white.withValues(alpha: 0.7),
              fontSize:   12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: ()=>onToggle(item),
            child: Icon(
              Icons.close_rounded,
              size:  12,
              color: AppColors.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    )).toList(),
      ),
    ),
        ],
        const SizedBox(height: 20),
      ],
    );
  }
}
