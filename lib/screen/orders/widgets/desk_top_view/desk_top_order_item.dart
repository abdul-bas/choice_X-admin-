import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/orders/controller/order_controller.dart';
import 'package:choice_x_admin/services/firestore_service/handle_async.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/widgets/cancell_order/cancel_order.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_details_content.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_details_header.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/order_summery_row.dart';
import 'package:flutter/material.dart';

class DesktopOrderItem extends StatelessWidget {
  const DesktopOrderItem({super.key, 
    required this.order,
    required this.logic,
    required this.isTablet,
    required this.isTab,
  });

  final OrderModel order;
  final OrdersLogic logic;
  final bool isTablet;
  final bool isTab;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: logic.loadOrderParties(order),
      builder: (context, asyncSnapshot) {
        final result = handleAsync(snapshot: asyncSnapshot);
        if (result != null) return result;

        final user = asyncSnapshot.data![0] as UserModel;
        final seller = asyncSnapshot.data![1] as SellerModel;

      
        final baseCard = Column(
          children: [
            OrderSummaryRow(
                order: order,
                user: user,
                seller: seller,
                isTablet: isTablet),
            OrderDetailsHeader(isTablet: isTablet),
            OrderDetailsContent(order: order, isTablet: isTablet),
          ],
        );

        if (logic.isCancelled(order)) {
          return CancelledOrderCard(
            order: order,
            logic: logic,
            isTab: isTab,
            margin: 10,
            child: baseCard,
          );
        }
        return baseCard;
      },
    );
  }
}