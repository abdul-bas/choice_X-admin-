import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:flutter/material.dart';

class BrandContoller {
  
 static void showSnackbarIfNeeded(BuildContext context, BrandCrud crud) {
    if (crud.message == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(crud.icon, color: AppColors.primary),
              const SizedBox(width: 10),
              Expanded(child: Text(crud.message!)),
            ],
          ),
          backgroundColor: crud.color,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
      crud.message = null;
    });
  }
  
}