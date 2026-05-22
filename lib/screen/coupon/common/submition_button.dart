
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponSubmitButton extends StatelessWidget {
  const CouponSubmitButton({
    super.key,
    required this.label,
    required this.isLoading,
    required this.onPressed,
  });

  final String       label;
  final bool         isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:         AppColors.sellerSurface,
          disabledBackgroundColor: AppColors.white.withValues(alpha: 0.15),
          padding:                 const EdgeInsets.symmetric(vertical: 20),
          elevation:               0,
          shape: RoundedRectangleBorder(
            side:         BorderSide(color: AppColors.white.withValues(alpha: 0.05)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width:  18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color:       AppColors.black45,
                ),
              )
            : Text(
                label,
                style: const TextStyle(
                  color:         AppColors.white,
                  fontWeight:    FontWeight.w700,
                  fontSize:      14,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }
}
