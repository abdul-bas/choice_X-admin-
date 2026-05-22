import 'package:fl_chart/fl_chart.dart';

abstract class DashboardChartHelper {
  
  static List<FlSpot> sliceSpots(List<FlSpot> all, int monthCount) {
    if (all.isEmpty) return [];
    final start = all.length - monthCount;
    return all
        .sublist(start < 0 ? 0 : start)
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.y))
        .toList();
  }
}
