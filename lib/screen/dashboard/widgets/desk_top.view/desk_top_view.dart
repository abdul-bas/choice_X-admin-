import 'package:choice_x_admin/screen/common/section_label/section_label.dart';
import 'package:choice_x_admin/screen/dashboard/controller/chart_helper.dart';
import 'package:choice_x_admin/screen/dashboard/controller/percents.dart';


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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';


class DashboardDeskLayout extends StatelessWidget {
  const DashboardDeskLayout({
    super.key,
    required this.isLoadingChart,
    required this.spots,
  });

  final bool         isLoadingChart;
  final List<FlSpot> spots;

  @override
  Widget build(BuildContext context) {
    return Consumer3<DashboardFilterProvider, OrderDetailsProvider,
        UserMgtProvider>(
      builder: (context, filter, orderProv, userProv, _) {
        final sellerProv    = context.read<SellerMgtProvider>();
        final f             = filter.statFilter;
        final filteredSpots =
            DashboardChartHelper.filterSpots(spots, filter.revenueMonthCount);
  
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                 padding: const EdgeInsets.fromLTRB(3, 3, 8, 3),
                  child: Row(children: [
                    const SectionLabel('Overview'),
                    const Spacer(),
                    const StatFilterBar(),
                  ]),
                ),
                const SizedBox(height: 12),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: DashBoardStatCard(
                          title:       'Total Revenue',
                          value:    orderProv.filteredRevenue(f),
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
                          title:       'Total Orders',
                          value:        orderProv.filteredOrderCount(f),
                          accentColor: getColorFromPercentage(
                              DashboardPercents.orders(
                                  orderProv.filteredOrderCount(f)
                                      .toDouble())),
                          progressKey: 'totalOrders',
                          arcSubLabel: f,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DashBoardStatCard(
                          title:       'Active Users',
                          value:      userProv.filteredUserCount(f),
                          accentColor: getColorFromPercentage(
                              DashboardPercents.activeUsers(
                                activeUsers: orderProv.activeUsers.toDouble(),
                                totalUsers:  userProv.totalUser.toDouble(),
                              )),
                          progressKey: 'activeUsers',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DashBoardStatCard(
                          title:       'Active Sellers',
                          value:   sellerProv.filteredSellerCount(f),
                          accentColor: getColorFromPercentage(
                              DashboardPercents.activeSellers(
                                activeSellers:
                                    sellerProv.activeSeller.toDouble(),
                                totalSellers:
                                    sellerProv.totalSeller.toDouble(),
                              )),
                          progressKey: 'activeSellers',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

           
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                         padding: const EdgeInsets.fromLTRB(8, 3, 3, 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            const SectionLabel('Revenue'),
                            const Spacer(),
                            const RevenueFilterBar(),
                          ]),
                          const SizedBox(height: 12),
                          Expanded(
                            child: isLoadingChart
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : LineChartWidget(
                                    isDesk:        true,
                                    spots:         filteredSpots,
                                    useAspectRatio: false,
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:3,horizontal: 8),
                      child: Column(
                        children: [ 
                      
                                    Row(children: [
                                      const SectionLabel('Order Status'),
                                      const Spacer(),
                                      const OrderStatusFilterBar(),
                                    ]),
                                    const SizedBox(height: 12),
                          Expanded(
                            child: const OrderStatusCardWidget(
                              isMobile:       false,
                              useAspectRatio: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
