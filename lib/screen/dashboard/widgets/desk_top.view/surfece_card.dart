import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SurfaceCard extends StatelessWidget {
  const SurfaceCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:   const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color:        AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}