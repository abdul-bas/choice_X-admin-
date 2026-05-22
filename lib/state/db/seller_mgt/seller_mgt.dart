import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerMgt extends ChangeNotifier {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String value = 'pending';

  statusChange(String newValue, String sellerId) async {
    value = newValue;
    await firebaseFirestore
        .collection('seller')
        .doc(sellerId)
        .update({'status': newValue});
    notifyListeners();
  }
}
