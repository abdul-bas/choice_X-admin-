
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/filter_row.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class StatFilterBar extends StatelessWidget {
  const StatFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<DashboardFilterProvider>();
    return FilterRow(
      filters:  DashboardFilterProvider.statFilters,
      selected: filter.statFilter,
      onTap:    filter.selectStatFilter,
    );
  }
}
