import 'package:flutter/material.dart';

class DashbordSideview extends ChangeNotifier {
  int index=0;
  toggleIndex(newIndex) {
    index = newIndex;
     notifyListeners(); 
  }
}
