 import 'package:choice_x_admin/screen/common/app_widgets/app_form_field.dart';
import 'package:choice_x_admin/screen/coupon/common/form_label.dart';
import 'package:choice_x_admin/screen/common/app_widgets/form_section.dart';
import 'package:flutter/material.dart';

class CouponDiscountSection extends StatelessWidget {
  const CouponDiscountSection({
    super.key,
    required this.discountController,
    required this.maxDiscountController,
  });

  final TextEditingController discountController;
  final TextEditingController maxDiscountController;

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Discount',
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel('Discount (%)'),
                const SizedBox(height: 6),
                AppFormField(
                  controller:   discountController,
                  hint:         'e.g. 25',
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    final n = double.tryParse(v.trim());
                    if (n == null) return 'Invalid';
                    if (n <= 0 || n > 100) return '1–100 only';
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormLabel('Max discount (₹)'),
                const SizedBox(height: 6),
                AppFormField(
                  controller:   maxDiscountController,
                  hint:         'e.g. 500',
                  keyboardType: TextInputType.number,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    final n = double.tryParse(v.trim());
                    if (n == null) return 'Invalid';
                    if (n <= 0) return 'Must be > 0';
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}