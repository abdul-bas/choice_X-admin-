
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/filter_fill.dart';

import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RevenueFilterBar extends StatelessWidget {
  const RevenueFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<DashboardFilterProvider>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: DashboardFilterProvider.revenueFilters.map((f) {
        return FilterPill(
          label: f,
          isSelected: filter.revenueFilter == f,
          onTap: () => filter.selectRevenueFilter(f),
        );
      }).toList(),
    );
  }
}
