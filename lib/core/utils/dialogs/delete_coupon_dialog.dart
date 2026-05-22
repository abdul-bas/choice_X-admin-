
import 'package:choice_x_admin/screen/coupon/delete/delete.dart';
import 'package:flutter/material.dart';

Future<void> showDeleteCouponDialog({
  required BuildContext context,
  required String couponName,
  required VoidCallback onDelete,
}) async {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withValues(alpha: 0.6),
    builder: (_) => DeleteCouponDialog(
      couponName: couponName,
      onDelete: onDelete,
    ),
  );
}