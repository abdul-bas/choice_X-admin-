import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/screen/coupon/common/apply_type.dart';
import 'package:choice_x_admin/screen/coupon/common/basic_info.dart';
import 'package:choice_x_admin/screen/coupon/common/disxount_info.dart';
import 'package:choice_x_admin/screen/coupon/common/header.dart';

import 'package:choice_x_admin/screen/coupon/common/picker_section.dart';
import 'package:choice_x_admin/screen/coupon/common/submition_button.dart';

import 'package:choice_x_admin/state/provider/coupon_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCouponScreen extends StatelessWidget {
  const EditCouponScreen({
    super.key,
    required this.coupon,
    required this.index,
  });

  final CouponModel coupon;
  final int         index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CouponFormProvider()..populate(coupon),
      child: Dialog(
        
             backgroundColor: AppColors.sellerSurface,
       
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container( margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.sellerSurfaceDeep,
          borderRadius: BorderRadius.circular(16),
        ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Consumer<CouponFormProvider>(
              builder: (context, p, _) {
                return Form(
                  key: p.formKey,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize:       MainAxisSize.min,
                      children: [
                        const AddCouponHeader(), 
                        const SizedBox(height: 28),
                        CouponBasicInfoSection(
                          titleController: p.couponTitleController,
                          codeController:  p.couponCodeController,
                        ),
                        const SizedBox(height: 20),
                        CouponDiscountSection(
                          discountController:    p.discountController,
                          maxDiscountController: p.maxDiscountController,
                        ),
                        const SizedBox(height: 20),
                        CouponApplyTypeSection(provider: p),
                        const SizedBox(height: 20),
                        CouponPickerSection(provider: p),
                        const SizedBox(height: 28),
                        CouponSubmitButton(
                          label:     'Update Coupon',
                          isLoading: p.isLoading,
                          onPressed: () => p.updateCoupon(context, coupon, index),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}