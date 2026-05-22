import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_info_row.dart';
import 'package:flutter/material.dart';

class OrderDetailsRows extends StatelessWidget {
  const OrderDetailsRows({super.key, required this.order, required this.isTablet});

  final OrderModel order;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final labelWidth = isTablet ? 100.0 : 120.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoRow(
          label: 'Order Date:',
          value: '11/12/2020',
          isTablet: isTablet,
          width: labelWidth,
        ),
        SizedBox(height: isTablet ? 3 : 4),
        InfoRow(
          label: 'Payment Method:',
          value: order.paymentMethod,
          isTablet: isTablet,
          width: labelWidth,
          maxLines: 2,
        ),
        SizedBox(height: isTablet ? 3 : 4),
        InfoRow(
          label: 'Shipping Address:',
          value: order.paymentAddress,
          isTablet: isTablet,
          width: labelWidth,
          maxLines: 3,
        ),
      ],
    );
  }
}
