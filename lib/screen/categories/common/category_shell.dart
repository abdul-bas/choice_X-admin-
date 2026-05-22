
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryDialogShell extends StatelessWidget {
  const CategoryDialogShell({super.key, required this.child, this.maxWidth = 440});
  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.sellerSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.sellerSurfaceDeep,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}