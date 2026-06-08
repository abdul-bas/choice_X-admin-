import 'package:choice_x_admin/screen/common/section_label/section_label.dart';
import 'package:choice_x_admin/screen/dashboard/controller/chart_helper.dart';
import 'package:choice_x_admin/screen/dashboard/controller/percents.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/empty_state/empty_state.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/filter_bar.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/order_status_card.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/order_status_card/order_status_filter_bar.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/revenue_over_view_card/revenue_over_view_card.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/revenue_over_view_card/widgets/revenue_filter_bar.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/stat_card/stat_card.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:choice_x_admin/core/utils/helpers/format_compact_number.dart';
import 'package:choice_x_admin/core/utils/helpers/get_percentage_color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScrollLayout extends StatelessWidget {
  const DashboardScrollLayout({
    super.key,
    required this.isMobile,
    required this.isDesk,
    required this.isLoadingChart,
    required this.spots,
  });

  final bool isMobile;
  final bool isDesk;
  final bool isLoadingChart;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return Consumer3<DashboardFilterProvider, OrderDetailsProvider,
        UserMgtProvider>(
      builder: (context, filter, orderProv, userProv, _) {
        final sellerProv = context.read<SellerMgtProvider>();
        final f = filter.statFilter;
        final filteredSpots =
            DashboardChartHelper.sliceSpots(spots, filter.revenueMonthCount);
       if (!orderProv.initialized) {
  return const Center(child: EmptyRevenueState());
}
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(children: [
                const SectionLabel('Overview'),
                const Spacer(),
                const StatFilterBar(),
              ]),
              const SizedBox(height: 10),
              Row(children: [
                Expanded(
                  child: DashBoardStatCard(
                    title: 'Total Revenue',
                    value: formatNumber(orderProv.filteredRevenue(f)),
                    accentColor: getColorFromPercentage(
                        DashboardPercents.revenue(
                            orderProv.filteredRevenue(f).toDouble())),
                    progressKey: 'revenue',
                    arcSubLabel: f,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DashBoardStatCard(
                    title: 'Total Orders',
                    value: formatNumber(orderProv.filteredOrderCount(f)),
                    accentColor: getColorFromPercentage(
                        DashboardPercents.orders(
                            orderProv.filteredOrderCount(f).toDouble())),
                    progressKey: 'totalOrders',
                    arcSubLabel: f,
                  ),
                ),
              ]),
              const SizedBox(height: 12),
              Row(children: [
                Expanded(
                  child: DashBoardStatCard(
                    title: 'Active Users',
                    value: formatNumber(userProv.totalUser),
                    accentColor:
                        getColorFromPercentage(DashboardPercents.activeUsers(
                      activeUsers: orderProv.activeUsers.toDouble(),
                      totalUsers: userProv.totalUser.toDouble(),
                    )),
                    progressKey: 'activeUsers',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DashBoardStatCard(
                    title: 'Active Sellers',
                    value: formatNumber(sellerProv.totalSeller),
                    accentColor:
                        getColorFromPercentage(DashboardPercents.activeSellers(
                      activeSellers: sellerProv.activeSeller.toDouble(),
                      totalSellers: sellerProv.totalSeller.toDouble(),
                    )),
                    progressKey: 'activeSellers',
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              Row(children: [
                const SectionLabel('Revenue Report'),
                const Spacer(),
                const RevenueFilterBar(),
              ]),
              const SizedBox(height: 12),
              SizedBox(
                height: 300,
                child: isLoadingChart
                    ? const Center(child: CircularProgressIndicator())
                    : LineChartWidget(
                        isDesk: isDesk,
                        spots: filteredSpots,
                        useAspectRatio: false,
                      ),
              ),
              const SizedBox(height: 20),
              Row(children: [
                const SectionLabel('Order Status'),
                const Spacer(),
                const OrderStatusFilterBar(),
              ]),
              const SizedBox(height: 12),
              const SizedBox(
                height: 250,
                child: OrderStatusCardWidget(
                  isMobile: true,
                  useAspectRatio: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
