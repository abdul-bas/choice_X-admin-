import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/dashboard/controller/order_status_entry.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/empty_state.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/legend_item.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/order_status_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderStatusCardWidget extends StatelessWidget {
  const OrderStatusCardWidget({
    super.key,
    required this.isMobile,
    this.useAspectRatio = true,
  });

  final bool isMobile;
  final bool useAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Consumer3<OrderDetailsProvider, OrderStatusProvider,
        DashboardFilterProvider>(
      builder: (context, orderProv, statusProv, filterProv, _) {
        if (orderProv.allTotalOrders == 0) return orderStatusEmptyState();

        final f = filterProv.orderStatusFilter;
        final counts = orderProv.statusCounts(f);
        final total = counts.values.fold(0.0, (a, b) => a + b);

        final sections = OrderStatusRegistry.entries.map((entry) {
          final ratio = statusProv.getValue(entry.key);
          return PieChartSectionData(
            color: entry.color,
            value: ratio > 0 ? ratio * 150 : 0.001,
            radius: 45,
            title: '',
            borderSide: BorderSide(
              color: entry.color.withValues(alpha: 0.3),
              width: 1.5,
            ),
          );
        }).toList();

        final hasData = counts.values.any((v) => v > 0);

        final inner = Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 20, 20),
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.sellerBorder),
          ),
          child: hasData
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      height: 220,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PieChart(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOutCubic,
                            PieChartData(
                              sectionsSpace: 2,
                              centerSpaceRadius: isMobile ? 40 : 60,
                              centerSpaceColor: AppColors.sellerSurfaceInput,
                              sections: sections,
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                total.toInt().toString(),
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'orders',
                                style: TextStyle(
                                  color: AppColors.white.withValues(alpha: 0.5),
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: OrderStatusRegistry.entries
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.all(3),
                                child: LegendItem(
                                  label: e.label,
                                  color: e.color,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                )
              : orderStatusEmptyState(),
        );

        return useAspectRatio
            ? AspectRatio(
                aspectRatio: isMobile ? 0.5 : 1.15,
                child: inner,
              )
            : inner;
      },
    );
  }
}
