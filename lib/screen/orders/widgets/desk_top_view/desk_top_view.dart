
  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/orders/controller/order_controller.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/desk_top_order_item.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/header_row.dart';
import 'package:flutter/material.dart';

class OrderDesktopView extends StatelessWidget {
  const OrderDesktopView({super.key, 
    required this.filteredOrders,
    required this.logic,
    required this.isTablet,
    required this.isTab,
  });

  final List<OrderModel> filteredOrders;
  final OrdersLogic logic;
  final bool isTablet;
  final bool isTab;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          OrderHeaderRow(isTablet: isTablet),
          const Divider(color: AppColors.sellerWhite10, height: 1),
          ListView.builder(
            itemCount: filteredOrders.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return DesktopOrderItem(
                order: filteredOrders[index],
                logic: logic,
                isTablet: isTablet,
                isTab: isTab,
              );
            },
          ),
        ],
      ),
    );
  }
}