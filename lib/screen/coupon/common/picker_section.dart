
  import 'package:choice_x_admin/screen/common/app_widgets/form_section.dart';
import 'package:choice_x_admin/screen/coupon/common/multi_picker_field.dart';
import 'package:choice_x_admin/state/provider/coupon_form_provider.dart';
import 'package:flutter/material.dart';

class CouponPickerSection extends StatelessWidget {
  const CouponPickerSection({super.key, required this.provider});
  final CouponFormProvider provider;

  @override
  Widget build(BuildContext context) {
    if (provider.applyType == 'category') {
      return FormSection(
        title: 'Categories',
        child: MultiPickerField(
          label:     'Categories',
          available: provider.availableCategories,
          selected:  provider.selectedCategories,
          onToggle:  provider.toggleCategory,
        ),
      );
    }
    if (provider.applyType == 'brand') {
      return FormSection(
        title: 'Brands',
        child: MultiPickerField(
          label:     'Brands',
          available: provider.availableBrands,
          selected:  provider.selectedBrands,
          onToggle:  provider.toggleBrand,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}