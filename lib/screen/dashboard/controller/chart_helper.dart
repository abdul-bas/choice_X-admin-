import 'package:fl_chart/fl_chart.dart';

abstract class DashboardChartHelper {
  
  static List<FlSpot> filterSpots(List<FlSpot> allSpots, int monthCount) {
    if (allSpots.isEmpty) return [];
    final start = allSpots.length - monthCount;
    return allSpots
        .sublist(start < 0 ? 0 : start)
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.y))
        .toList();
  }
}
