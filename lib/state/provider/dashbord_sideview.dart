import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordSideview extends ChangeNotifier {
  static const String _indexKey = 'dashboard_side_index';

  int _index = 0;

  int get index => _index;

  DashbordSideview() {
    loadIndex();
  }

  Future<void> loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    _index = prefs.getInt(_indexKey) ?? 0;
    notifyListeners();
  }

  Future<void> toggleIndex(int newIndex) async {
    _index = newIndex;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_indexKey, _index);

    notifyListeners();
  }
}
