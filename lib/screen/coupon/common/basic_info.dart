
  import 'package:choice_x_admin/screen/common/app_widgets/app_form_field.dart';
import 'package:choice_x_admin/screen/coupon/common/form_label.dart';
import 'package:choice_x_admin/screen/common/app_widgets/form_section.dart';
import 'package:flutter/material.dart';

class CouponBasicInfoSection extends StatelessWidget {
  const CouponBasicInfoSection({
    super.key,
    required this.titleController,
    required this.codeController,
  });

  final TextEditingController titleController;
  final TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: 'Basic info',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormLabel('Coupon title'),
          const SizedBox(height: 6),
          AppFormField(
            controller: titleController,
            hint:       'e.g. Summer Sale',
            validator:  (v) =>
                v == null || v.trim().isEmpty ? 'Title is required' : null,
          ),
          const SizedBox(height: 16),
          const FormLabel('Coupon code'),
          const SizedBox(height: 6),
          AppFormField(
            controller:         codeController,
            hint:               'e.g. SUMMER25',
            textCapitalization: TextCapitalization.characters,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'Code is required';
              if (v.trim().contains(' ')) return 'No spaces allowed';
              return null;
            },
          ),
        ],
      ),
    );
  }
}