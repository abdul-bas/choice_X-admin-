import 'package:choice_x_admin/core/utils/dialogs/delete_coupon_dialog.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/create/add_coupon.dart';
import 'package:choice_x_admin/screen/coupon/update/edit_coupen.dart';
import 'package:choice_x_admin/state/provider/coupon_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadController {
  
static  void openEdit(BuildContext context, CouponModel coupon, int index) {
    showDialog(
      context: context,
      builder: (_) => EditCouponScreen(coupon: coupon, index: index),
    );
  }

static  void openDelete(BuildContext context, CouponModel coupon, int index) {
    showDeleteCouponDialog(
      context:    context,
      couponName: coupon.title,
      onDelete:   () => context
          .read<CouponFilterProvider>()
          .deleteCoupon(index, coupon.id, context),
    );
  }

 static void openAdd(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AddCouponScreen(),
    );
  }

}
