
  import 'package:choice_x_admin/core/constants/app_colors.dart' show AppColors;
import 'package:flutter/material.dart';



class SellerMobileInfoRow extends StatelessWidget {
  const SellerMobileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String   label;
  final String   value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: AppColors.white),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(fontSize: 12, color: AppColors.white),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: AppColors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}