import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardChartProvider extends ChangeNotifier {
  List<FlSpot> allSpots = [];
  bool isLoadingChart = false;

  void setSpots(List<FlSpot> spots) {
    allSpots = spots;
    isLoadingChart = false;
    notifyListeners();
  }

  void setLoading(bool val) {
    isLoadingChart = val;
    notifyListeners();
  }
}