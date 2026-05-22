
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyChartState extends StatelessWidget {
  const EmptyChartState({super.key, required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:   const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color:        AppColors.sellerSurfaceInput,
        borderRadius: BorderRadius.circular(15),
        border:       Border.all(color: AppColors.sellerBorder),
      ),
      child: AspectRatio(
        aspectRatio: isMobile ? 1.4 : 1.79,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bar_chart_rounded,
              size:  48,
              color: AppColors.white.withValues(alpha: 0.15),
            ),
            const SizedBox(height: 12),
            Text(
              'No revenue data yet',
              style: TextStyle(
                color:      AppColors.white.withValues(alpha: 0.4),
                fontSize:   14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Data will appear once orders are placed',
              style: TextStyle(
                color:    AppColors.white.withValues(alpha: 0.2),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
