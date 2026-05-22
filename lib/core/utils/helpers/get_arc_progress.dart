import 'package:choice_x_admin/state/provider/arc_progress_provider.dart';

double getArcProgress(ArcProgressProvider provider, dynamic progressKey) {
    switch (progressKey) {
      case 'revenue':
        return provider.revenueProgress;
      case 'activeUsers':
        return provider.activeUsersProgress;
      case 'activeSellers':
        return provider.conversionProgress;
      case 'totalOrders':
        return provider.totalOrdersProgress;
      default:
        return 0;
    }
  }