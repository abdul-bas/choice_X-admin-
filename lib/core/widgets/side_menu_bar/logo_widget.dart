
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class LogoMark extends StatelessWidget {
  const LogoMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Center(
            child: Text(
              'CX',
              style: TextStyle(
                color: AppColors.sellerBg,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Choice_X',
          style: TextStyle(
            color: AppColors.sellerHeading,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}