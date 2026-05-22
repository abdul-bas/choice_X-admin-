 import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_detais.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/product_info.dart';
import 'package:flutter/material.dart';

class OrderDetailsContent extends StatelessWidget {
  const OrderDetailsContent({super.key, 
    required this.order,
    required this.isTablet,
  });

  final OrderModel order;
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
        padding: EdgeInsets.only(
          left: isTablet ? 10 : 15,
          right: isTablet ? 10 : 15,
          bottom: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: ProductInfoRow(order: order, isTablet: isTablet),
            ),
            Expanded(
              flex: 6,
              child: OrderDetailsRows(order: order, isTablet: isTablet),
            ),
          ],
        ),
      ),
    );
  }
}