import 'package:choice_x_admin/screen/brand/common/actions/actions.dart';
import 'package:choice_x_admin/screen/brand/common/header/header.dart';
import 'package:choice_x_admin/screen/brand/common/image_picker/image_picker.dart';
import 'package:choice_x_admin/screen/brand/common/name_field/name_field.dart';
import 'package:choice_x_admin/screen/categories/common/category_shell.dart';
import 'package:choice_x_admin/screen/categories/controller/category_controller.dart';
import 'package:choice_x_admin/screen/common/app_widgets/app_loading.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> {
  @override
  void initState() {
    final c = context.read<CategoryProvider>();
    c.reset();
    super.initState();
  }

  @override
  void dispose() {
    final c = context.read<CategoryProvider>();
    c.reset();
    super.dispose();
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
                    title: CategoryController.kCategoryTitle,
                    subtitle: CategoryController.kCategorySubtitle,
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
                    onSubmit: () => CategoryController.createCategory(context),
                    actionTitle: 'Add category',
                    actionIcon: CategoryController.kCategoryIcon,
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
