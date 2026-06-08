import 'package:choice_x_admin/core/utils/helpers/format_compact_number.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/empty_state/empty_state.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/filter_row.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderStatusFilterBar extends StatelessWidget {
  const OrderStatusFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<DashboardFilterProvider>();
   
    return FilterRow(
      filters: DashboardFilterProvider.orderStatusFilters,
      selected: filter.orderStatusFilter,
      onTap: filter.selectOrderStatusFilter,
    );
  }
}
