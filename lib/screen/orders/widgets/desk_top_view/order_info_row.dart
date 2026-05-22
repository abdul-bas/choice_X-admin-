  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, 
    required this.label,
    required this.value,
    required this.isTablet,
    this.width,
    this.maxLines = 1,
  });

  final String label;
  final String value;
  final bool isTablet;
  final double? width;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width ?? (isTablet ? 70 : 80),
          child: Text(
            label,
            style: TextStyle(
              fontSize: isTablet ? 9 : 10,
              color: AppColors.sellerWhite54,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: isTablet ? 9 : 10,
              color: AppColors.sellerWhite60,
            ),
          ),
        ),
      ],
    );
  }
}
