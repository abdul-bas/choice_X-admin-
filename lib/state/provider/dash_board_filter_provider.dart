import 'package:flutter/material.dart';

class DashboardFilterProvider extends ChangeNotifier {
  static const List<String> statFilters = ['Today', 'This Week', 'This Month'];

  String _statFilter = 'This Month';
  String get statFilter => _statFilter;

  void selectStatFilter(String f) {
    if (_statFilter == f) return;
    _statFilter = f;
    notifyListeners();
  }

  static const List<String> orderStatusFilters = [
    'Today',
    'This Week',
    'This Month'
  ];

  String _orderStatusFilter = 'This Month';
  String get orderStatusFilter => _orderStatusFilter;

  void selectOrderStatusFilter(String f) {
    if (_orderStatusFilter == f) return;
    _orderStatusFilter = f;
    notifyListeners();
  }

  static const List<String> revenueFilters = [
    'Last 3 Months',
    'Last 6 Months',
    'Last 12 Months'
  ];

  String _revenueFilter = 'Last 3 Months';
  String get revenueFilter => _revenueFilter;

  int get revenueMonthCount {
    switch (_revenueFilter) {
      case 'Last 6 Months':
        return 6;
      case 'Last 12 Months':
        return 12;
      default:
        return 3;
    }
  }

  void selectRevenueFilter(String f) {
    if (_revenueFilter == f) return;
    _revenueFilter = f;
    notifyListeners();
  }
}
