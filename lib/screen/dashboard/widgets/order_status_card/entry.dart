
import 'dart:ui';

import 'package:choice_x_admin/state/provider/order_status_provider.dart';

class OrderStatusEntry {
  const OrderStatusEntry(this.label, this.color, this.key, this.provider);

  final String label;
  final Color color;
  final String key;
  final OrderStatusProvider provider;

  double get ratio => provider.getValue(key);
}