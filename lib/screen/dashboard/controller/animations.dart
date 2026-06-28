import 'package:choice_x_admin/screen/dashboard/controller/percents.dart';
import 'package:choice_x_admin/state/provider/arc_progress_provider.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/order_status_provider.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class DashboardAnimations {
  
  static Future<void> triggerAll(
    BuildContext context, {
    required ArcProgressProvider arcProvider,
    required OrderStatusProvider orderStatusProvider,
    required DashboardFilterProvider filterProvider,
    required bool mounted,
  }) async {
    final orderProvider  = context.read<OrderDetailsProvider>();
    final userProvider   = context.read<UserMgtProvider>();
    final sellerProvider = context.read<SellerMgtProvider>();

    await Future.wait([
      orderProvider.fetchTotalOrder(),
      sellerProvider.fetchTotalSeller(),
      userProvider.fetchUserStats(),
    ]);

    if (!mounted) return;

    triggerArcAnimations(
      arcProvider:    arcProvider,
      orderProvider:  orderProvider,
      userProvider:   userProvider,
      sellerProvider: sellerProvider,
      statFilter:     filterProvider.statFilter,
    );

    triggerPieAnimation(
      statusProvider: orderStatusProvider,
      orderProvider:  orderProvider,
      filter:         filterProvider.orderStatusFilter,
    );
  }

  static void triggerArcAnimations({
    required ArcProgressProvider arcProvider,
    required OrderDetailsProvider orderProvider,
    required UserMgtProvider userProvider,
    required SellerMgtProvider sellerProvider,
    required String statFilter,
  }) {
    arcProvider
      ..startAnimation(
        key: 'revenue',
        target: DashboardPercents.revenue(
          orderProvider.filteredRevenue(statFilter).toDouble(),
        ),
      )
      ..startAnimation(
        key: 'totalOrders',
        target: DashboardPercents.orders(
          orderProvider.filteredOrderCount(statFilter).toDouble(),orderProvider.allTotalOrders.toDouble(),statFilter
        ),
      )
      ..startAnimation(
        key: 'activeUsers',
        target: DashboardPercents.activeUsers(
          activeUsers: orderProvider.activeUsers.toDouble(),
          totalUsers:  userProvider.totalUser.toDouble(),
        ),
      )
      ..startAnimation(
        key: 'activeSellers',
        target: DashboardPercents.activeSellers(
          activeSellers: sellerProvider.activeSeller.toDouble(),
          totalSellers:  sellerProvider.totalSeller.toDouble(),
        ),
      );
  }

  static void triggerPieAnimation({
    required OrderStatusProvider statusProvider,
    required OrderDetailsProvider orderProvider,
    required String filter,
  }) {
    final counts = orderProvider.statusCounts(filter);
    final total  = counts.values.fold(0.0, (a, b) => a + b);

    statusProvider.setTargets({
      for (final e in counts.entries)
        e.key: total == 0 ? 0 : (e.value / total).clamp(0.0, 1.0),
    });
  }
}