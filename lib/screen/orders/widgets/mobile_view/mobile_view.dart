import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/orders/controller/order_controller.dart';
import 'package:choice_x_admin/screen/orders/widgets/cancell_order/cancel_order.dart';
import 'package:choice_x_admin/screen/orders/widgets/mobile_view/mobile_order_card.dart';
import 'package:choice_x_admin/services/firestore_service/handle_async.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:flutter/material.dart';

class OrderMobileView extends StatelessWidget {
  const OrderMobileView({super.key, 
    required this.filteredOrders,
    required this.logic,
    required this.isTab,
  });

  final List<OrderModel> filteredOrders;
  final OrdersLogic logic;
  final bool isTab;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal:2, vertical: 2),
      itemCount: filteredOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final order = filteredOrders[index];
        return FutureBuilder(
          future: logic.loadOrderParties(order),
          builder: (context, asyncSnapshot) {
            final result = handleAsync(snapshot: asyncSnapshot);
            if (result != null) return result;

            final user = asyncSnapshot.data![0] as UserModel;
            final seller = asyncSnapshot.data![1] as SellerModel;

            final baseCard =
                OrderMobileCard(order: order, user: user, seller: seller);

            if (logic.isCancelled(order)) {
              return CancelledOrderCard(
                order: order,
                logic: logic,
                isTab: isTab,
                margin: 0,
                child: baseCard,
              );
            }
            return baseCard;
          },
        );
      },
    );
  }
}
