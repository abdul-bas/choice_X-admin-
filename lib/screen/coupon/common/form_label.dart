import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class FormLabel extends StatelessWidget {
  const FormLabel(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color:      AppColors.white.withValues(alpha: 0.7),
        fontSize:   13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}