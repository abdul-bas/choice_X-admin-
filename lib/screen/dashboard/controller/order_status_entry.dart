import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class OrderStatusEntry {
  const OrderStatusEntry({
    required this.label,
    required this.color,
    required this.key,
  });

  final String label;
  final Color  color;
  final String key;
}

abstract class OrderStatusRegistry {
  static const List<OrderStatusEntry> entries = [
    OrderStatusEntry(
      label: 'Order Placed',
      color: AppColors.orderStatusPlaced,
      key:   'placed',
    ),
    OrderStatusEntry(
      label: 'Confirmed',
      color: AppColors.orderStatusConfirmed,
      key:   'confirmed',
    ),
    OrderStatusEntry(
      label: 'Processing',
      color: AppColors.orderStatusProcessing,
      key:   'processing',
    ),
    OrderStatusEntry(
      label: 'Out for Delivery',
      color: AppColors.orderStatusDelivery,
      key:   'outForDelivery',
    ),
    OrderStatusEntry(
      label: 'Delivered',
      color: AppColors.orderStatusDelivered,
      key:   'delivered',
    ),
    OrderStatusEntry(
      label: 'Cancelled',
      color: AppColors.orderStatusCancelled,
      key:   'cancelled',
    ),
  ];
}