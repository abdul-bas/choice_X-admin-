
import 'package:choice_x_admin/screen/dashboard/controller/targets.dart';

abstract class DashboardPercents {
  static double revenue(double filtered) =>
      DashboardTargets.monthlyRevenue == 0
          ? 0
          : (filtered / DashboardTargets.monthlyRevenue * 100)
              .clamp(0.0, 100.0);

  static double orders(double filtered) =>
      DashboardTargets.monthlyOrders == 0
          ? 0
          : (filtered / DashboardTargets.monthlyOrders * 100)
              .clamp(0.0, 100.0);

  static double activeUsers({
    required double activeUsers,
    required double totalUsers,
  }) =>
      totalUsers == 0 ? 0 : (activeUsers / totalUsers * 100).clamp(0.0, 100.0);
static double activeSellers({
  required double activeSellers,
  required double totalSellers,
}) {
  if (totalSellers == 0) return 0;

  final percent =
      (activeSellers / totalSellers * 100);

  if (percent > 0 && percent < 5) {
    return 5;
  }

  return percent.clamp(0.0, 100.0);
}
}
