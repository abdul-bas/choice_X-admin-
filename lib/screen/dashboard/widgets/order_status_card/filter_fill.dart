
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FilterPill extends StatelessWidget {
  const FilterPill({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String       label;
  final bool         isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration:  const Duration(milliseconds: 200),
        margin:    const EdgeInsets.only(left: 6),
        padding:   const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.brand
              : AppColors.white.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.brand
                : AppColors.white.withValues(alpha: 0.1),
            width: 0.8,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? AppColors.white
                : AppColors.white.withValues(alpha: 0.45),
            fontSize:   11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
