import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/utils/snackbar/error_snackbar.dart';
import 'package:choice_x_admin/core/utils/snackbar/success_snackbar.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  
 static Future<void> updateBrand(BuildContext context, String id, int index) async {
    final provider = context.read<BrandProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a logo image');
      return;
    }

    final success = await provider.updateBrand(id, index);
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Brand updated successfully');
    } else {
      showError(context, 'Failed to update brand');
    }
  }
 static Future<void> createBrand(BuildContext context) async {
    final provider = context.read<BrandProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a logo image');
      return;
    }

    final success = await provider.createBrand();
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Brand created successfully');
    } else {
      showError(context, 'Failed to create brand');
    }
  }
  
}