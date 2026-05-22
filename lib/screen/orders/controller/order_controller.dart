

import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/state/db/orders/orders_oprations.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OrdersLogic {
  final OrdersOprations ops =
      OrdersOprations();

 Stream<QuerySnapshot<Map<String, dynamic>>>readOrders() {
    return ops.readOrders();
  }

  Future<List<dynamic>> loadOrderParties(
    OrderModel order,
  ) async {
    return await Future.wait([
      ops.getUserData(order.userId),
      ops.getSellerData(order.sellerId),
    ]);
  }

  
  bool isCancelled(OrderModel order) {
    return order.cancellationReason != null;
  }

  
  CancellationInfo parseCancellationReason(
    OrderModel order,
  ) {
    final parts =
        order.cancellationReason
            ?.split('_') ??
        [];

    return CancellationInfo(
      line1:
          parts.isNotEmpty
              ? parts[0]
              : 'Not Provided',
      line2:
          parts.length > 1
              ? parts[1]
              : '',
    );
  }

 
  void syncToProvider(
    BuildContext context,
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  ) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      context
          .read<OrderDetailsProvider>()
          .setOrders(snapshot: snapshot);
    });
  }
}

class CancellationInfo {
  const CancellationInfo({
    required this.line1,
    required this.line2,
  });

  final String line1;
  final String line2;
}