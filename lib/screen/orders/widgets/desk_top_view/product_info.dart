 import 'dart:convert';

import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_info_row.dart';
import 'package:flutter/material.dart';

class ProductInfoRow extends StatelessWidget {
  const ProductInfoRow({super.key, required this.order, required this.isTablet});

  final OrderModel order;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: isTablet ? 70 : 80,
          width: isTablet ? 50 : 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: MemoryImage(base64Decode(order.images)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: isTablet ? 8 : 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(
                  label: 'Product:',
                  value: order.productName,
                  isTablet: isTablet),
              SizedBox(height: isTablet ? 3 : 4),
              InfoRow(
                  label: 'Model:',
                  value: order.model,
                  isTablet: isTablet),
              SizedBox(height: isTablet ? 3 : 4),
              InfoRow(
                  label: 'Brand:',
                  value: order.brand,
                  isTablet: isTablet),
              SizedBox(height: isTablet ? 3 : 4),
              InfoRow(
                label: 'Quantity:',
                value: '${order.quantity} × ₹${order.amount}',
                isTablet: isTablet,
              ),
            ],
          ),
        ),
      ],
    );
  }
}