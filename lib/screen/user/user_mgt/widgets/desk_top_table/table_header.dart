import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class UserTableHeader extends StatelessWidget {
  const UserTableHeader(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color:AppColors.white,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 1));
  }
}