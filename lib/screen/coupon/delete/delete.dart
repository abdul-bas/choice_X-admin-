import 'dart:async';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/coupon/delete/widgets/actions.dart';
import 'package:choice_x_admin/screen/coupon/delete/widgets/coupon_preview.dart';
import 'package:choice_x_admin/screen/coupon/delete/widgets/header.dart';
import 'package:choice_x_admin/screen/coupon/delete/widgets/warning.dart';
import 'package:flutter/material.dart';

class DeleteCouponDialog extends StatelessWidget {
  DeleteCouponDialog({
    super.key,
    required this.couponName,
    required this.onDelete,
  });

  final String       couponName;
  final FutureOr<void> Function() onDelete;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.sellerSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize:       MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DeleteCouponHeader(),
              const SizedBox(height: 16),
              CouponPreviewRow(couponName: couponName),
              const SizedBox(height: 14),
              const CouponDeleteWarning(),
              const SizedBox(height: 24),
              CouponDeleteActions(
                isLoading: _isLoading,
                onDelete:  onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}