import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CouponCrud extends ChangeNotifier {
  String? message;
  IconData? icon;
  Color? color;

  Future<void> addCoupon(CouponModel coupon) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('coupon').doc();

      final data = coupon.toMap();
      data['id'] = docRef.id;

      await docRef.set(data);

      message = 'Coupon added successfully!';
      icon = Icons.check_circle;
      color = Colors.green;
    } catch (e) {
      message = 'Failed to add coupon! $e';
      icon = Icons.error;
      color = Colors.red;
    }

    notifyListeners();
  }

  Stream<QuerySnapshot> readCoupon() {
    return FirebaseFirestore.instance.collection('coupon').snapshots();
  }

  Future<void> toggleStatus(String id) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('coupon').doc(id);

      final doc = await docRef.get();

      if (!doc.exists) {
        message = 'Coupon not found';
        icon = Icons.error;
        color = Colors.red;
        notifyListeners();
        return;
      }

      final bool status = doc.data()!['isActive'] ?? false;

      await docRef.update({
        'isActive': !status,
      });

      message = status
          ? 'Coupon deactivated successfully!'
          : 'Coupon activated successfully!';
      icon = Icons.check_circle;
      color = Colors.green;
    } catch (e) {
      message = 'Failed to update coupon status! $e';
      icon = Icons.error;
      color = Colors.red;
    }

    notifyListeners();
  }

  Future<void> updateCoupon(CouponModel coupon) async {
    try {
      final docRef =
          FirebaseFirestore.instance.collection('coupon').doc(coupon.id);
      await docRef.update(coupon.toMap());

      icon = Icons.check_circle;
      color = Colors.green;
    } catch (e) {
      message = 'Failed to update coupon status! $e';
      icon = Icons.error;
      color = Colors.red;
    }

    notifyListeners();
  }

  Future<void> deleteCoupon(String id) async {
  try {
    final docRef =
        FirebaseFirestore.instance.collection('coupon').doc(id);

    final doc = await docRef.get();

    if (!doc.exists) {
      message = 'Coupon not found';
      icon = Icons.error;
      color = Colors.red;
      notifyListeners();
      return;
    }

    await docRef.delete();

    message = 'Coupon deleted successfully!';
    icon = Icons.check_circle;
    color = Colors.green;
  } catch (e) {
    message = 'Failed to delete coupon! $e';
    icon = Icons.error;
    color = Colors.red;
  }

  notifyListeners();
}

}
