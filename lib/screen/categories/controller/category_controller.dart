import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/utils/snackbar/error_snackbar.dart';
import 'package:choice_x_admin/core/utils/snackbar/success_snackbar.dart';
import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryController {
  
 static void showCategorySnackbarIfNeeded(BuildContext context, CategoryCrud crud) {
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
 static  final kCategoryIcon     = Icons.category_outlined;
 static final kCategoryTitle    = 'Categories';
static final kCategorySubtitle = 'Organize products into categories';
static final kFieldLabel       = 'Category name';

 static Future<void> updateCategory(BuildContext context, String id, int index) async {
    final provider = context.read<CategoryProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a category image');
      return;
    }

    final success =
        await provider.updateCategory(id, index);
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Category updated successfully');
    } else {
      showError(context, 'Failed to update category');
    }
  }
  
static  Future<void> createCategory(BuildContext context) async {
    final provider = context.read<CategoryProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a category image');
      return;
    }

    final success = await provider.createCategory();
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Category created successfully');
    } else {
      showError(context, 'Failed to create category');
    }
  }
}