import 'package:flutter/material.dart';

class DashbordSeller extends ChangeNotifier {
  int activeSeller = 0;
  int blockedSeller = 0;

  int countActiveSeller(dynamic sellers) {
    int count = 0;
    for (var doc in sellers) {
      if (doc['status'] == 'approved') {
        count++;
      }
    }
    activeSeller = count;
    notifyListeners();
    return count;
  }

  int countBlockedSeller(dynamic sellers) {
    int count = 0;
    for (var doc in sellers) {
      if (doc['status'] == 'reject') {
        count++;
      }
    }
    blockedSeller = count;
    notifyListeners();
    return count;
  }
}
