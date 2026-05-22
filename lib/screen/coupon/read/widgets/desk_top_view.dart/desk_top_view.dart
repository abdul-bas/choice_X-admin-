
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/common/empty_coupon.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/desk_top_view.dart/coupon_card.dart';
import 'package:flutter/material.dart';

class CouponDesktopView extends StatelessWidget {
  const CouponDesktopView({
    super.key,
    required this.coupons,
    required this.onEdit,
    required this.onDelete,
  });

  final List<CouponModel>          coupons;
  final void Function(int)         onEdit;
  final void Function(int)         onDelete;

  @override
  Widget build(BuildContext context) {
    return coupons.isEmpty
        ? const EmptyCoupons()
        : ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GridView.builder(
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:   4,
              mainAxisExtent:   230,
              crossAxisSpacing: 12,
              mainAxisSpacing:  12,
            ),
            itemCount: coupons.length,
            itemBuilder: (_, i) => CouponCard(
              coupon:   coupons[i],
              index:    i,
              onEdit:   () => onEdit(i),
              onDelete: () => onDelete(i),
            ),
          ),
        );
  }
}
