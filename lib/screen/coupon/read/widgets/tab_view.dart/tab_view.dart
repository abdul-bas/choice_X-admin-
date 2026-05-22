import 'package:choice_x_admin/screen/coupon/read/widgets/common/empty_coupon.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/tab_view.dart/compact_row.dart';
import 'package:flutter/material.dart';


class CouponTabletView extends StatelessWidget {
  const CouponTabletView({
    super.key,
    required this.coupons,
    required this.onEdit,
    required this.onDelete,
  });

  final List<CouponModel>  coupons;
  final void Function(int) onEdit;
  final void Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    if (coupons.isEmpty) return const EmptyCoupons();

    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: ListView.builder(
        itemCount: coupons.length,
        itemBuilder: (_, i) => CouponCompactRow(
          coupon:   coupons[i],
          index:    i,
          onEdit:   () => onEdit(i),
          onDelete: () => onDelete(i),
        ),
      ),
    );
  }
}
