
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SellerActionButton extends StatelessWidget {
  const SellerActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.foreground,
    required this.background,
    required this.border,
    required this.onTap,
  });

  
  const SellerActionButton.accept({super.key, required this.onTap})
      : label      = 'Accept',
        icon       = Icons.check_rounded,
        foreground = AppColors.acceptFg,
        background = AppColors.acceptBg,
        border     = AppColors.acceptBorder;

  
  const SellerActionButton.reject({super.key, required this.onTap})
      : label      = 'Reject',
        icon       = Icons.close_rounded,
        foreground = AppColors.rejectFg,
        background = AppColors.rejectBg,
        border     = AppColors.rejectBorder;

  final String       label;
  final IconData     icon;
  final Color        foreground;
  final Color        background;
  final Color        border;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: border, width: 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 13, color: foreground),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: foreground,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
