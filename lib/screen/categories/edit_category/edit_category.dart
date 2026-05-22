
import 'package:choice_x_admin/model/category_model/category_model.dart';
import 'package:choice_x_admin/screen/brand/common/actions/actions.dart';
import 'package:choice_x_admin/screen/brand/common/header/header.dart';
import 'package:choice_x_admin/screen/brand/common/image_picker/image_picker.dart';
import 'package:choice_x_admin/screen/brand/common/name_field/name_field.dart';
import 'package:choice_x_admin/screen/categories/common/category_shell.dart';
import 'package:choice_x_admin/screen/categories/controller/category_controller.dart';
import 'package:choice_x_admin/screen/common/app_widgets/app_loading.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:choice_x_admin/core/utils/snackbar/error_snackbar.dart';
import 'package:choice_x_admin/core/utils/snackbar/success_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateCategory extends StatefulWidget {
  const UpdateCategory({
    super.key,
    required this.category,
    required this.index,
  });

  final CategoryModel category;
  final int index;

  @override
  State<UpdateCategory> createState() => _UpdateCategoryState();
}

class _UpdateCategoryState extends State<UpdateCategory> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoryProvider>().populate(widget.category);
    });
  }

  Future<void> _submit(BuildContext context) async {
    final provider = context.read<CategoryProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a category image');
      return;
    }

    final success =
        await provider.updateCategory(widget.category.id, widget.index);
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Category updated successfully');
    } else {
      showError(context, 'Failed to update category');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const CategoryDialogShell(child: AppLoading());
        }

        return CategoryDialogShell(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   BrandHeader(
                    title: 'Update category',
                    subtitle:CategoryController. kCategorySubtitle,
                    icon: CategoryController.kCategoryIcon,
                  ),
                  const SizedBox(height: 24),
                  BrandImagePicker(
                    bytes: provider.imageBytes,
                    onTap: provider.fileUpload,
                  ),
                  const SizedBox(height: 20),
                  BrandNameField(
                    controller: provider.nameController,
                    fieldLabel: CategoryController.kFieldLabel,
                  ),
                  const SizedBox(height: 24),
                  BrandActions(
                    onSubmit: () => _submit(context),
                    actionTitle: 'Update category',
                    actionIcon: Icons.update,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
