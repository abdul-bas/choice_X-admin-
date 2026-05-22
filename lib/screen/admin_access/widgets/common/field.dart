
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';



class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.validator,
    this.obscure = false,
    this.suffixIcon,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final String? Function(String?)? validator;
  final bool obscure;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  static const _radius = 10.0;
  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: AppColors.sellerBorder),
  );
  static const _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: AppColors.sellerAccent, width: 1.5),
  );
  static const _errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: AppColors.danger),
  );
  static const _focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: AppColors.danger, width: 1.5),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(
        color: AppColors.sellerHeading,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      cursorColor: AppColors.sellerAccent,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: AppColors.sellerSubtitle,
          fontSize: 13.5,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 14, right: 10),
          child: Icon(icon, color: AppColors.sellerSubtitle, size: 17),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.sellerBg,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedBorder,
        errorBorder: _errorBorder,
        focusedErrorBorder: _focusedErrorBorder,
        errorStyle: const TextStyle(
          color: AppColors.danger,
          fontSize: 11.5,
        ),
      ),
    );
  }
}