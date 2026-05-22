 import 'package:choice_x_admin/screen/common/app_widgets/app_form_field.dart';
import 'package:choice_x_admin/screen/common/app_widgets/form_section.dart';
import 'package:flutter/material.dart';

class BrandNameField extends StatelessWidget {
  const BrandNameField({
    super.key,
    required this.controller,
    this.fieldLabel = 'Brand name',
  });

  final TextEditingController controller;
  final String fieldLabel;

  @override
  Widget build(BuildContext context) {
    return FormSection(
      title: fieldLabel,
      child: AppFormField(
        controller: controller,
        hint: 'e.g. Nike',
        textCapitalization: TextCapitalization.words,
        validator: (v) {
          if (v == null || v.trim().isEmpty) return 'Brand name is required';
          if (v.trim().length < 2) return 'Name must be at least 2 characters';
          return null;
        },
      ),
    );
  }
}