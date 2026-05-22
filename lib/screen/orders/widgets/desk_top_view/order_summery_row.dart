 import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:flutter/material.dart';

class OrderSummaryRow extends StatelessWidget {
  const OrderSummaryRow({super.key, 
    required this.order,
    required this.user,
    required this.seller,
    required this.isTablet,
  });

  final OrderModel order;
  final UserModel user;
  final SellerModel seller;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final fontSize = isTablet ? 10.0 : 12.0;
    final hPad = isTablet ? 10.0 : 15.0;
    final vPad = isTablet ? 10.0 : 12.0;

    final cells = [
      order.orderId,
      user.name,
      seller.userName,
      order.itemStatus,
      order.paymentStatus,
      '₹${order.amount}',
    ];

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Row(
        children: cells
            .map(
              (c) => Expanded(
                flex: 2,
                child: Text(
                  c,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: fontSize,
                    color: AppColors.sellerWhite70,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
