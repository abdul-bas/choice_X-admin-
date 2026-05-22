
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            AppColors.sellerWhite10,
            Color(0x1FFFFFFF),  
            Color(0x3DFFFFFF),  
            AppColors.brandSubtle,
            Color(0x3DFFFFFF),
            Color(0x1FFFFFFF),
            AppColors.sellerWhite10,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 10 : 15,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Text(
                'Ordered Item',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: isTablet ? 10 : 12,
                  color: AppColors.white,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                'Order Details',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: isTablet ? 10 : 12,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}