import 'package:choice_x_admin/screen/categories/common/category_shell.dart';
import 'package:choice_x_admin/screen/categories/controller/category_controller.dart';
import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/actions.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/header.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/preview.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/warning.dart';
import 'package:choice_x_admin/core/utils/helpers/format_id.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeleteCategory extends StatelessWidget {
  DeleteCategory({super.key, required this.id});

  final String id;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return CategoryDialogShell(
      maxWidth: 380,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDeleteHeader(title: 'category'),
            const SizedBox(height: 16),
            buildDeletePreview(
              id: formatId(id),
              title: 'Category',
              icon:CategoryController. kCategoryIcon,
            ),
            const SizedBox(height: 14),
            buildDeleteWarning(
              message:
                  'All products linked to this category will lose their category association.',
            ),
            const SizedBox(height: 24),
            buildDeleteActions(
              context: context,
              isLoading: _isLoading,
              title: 'category',
              icon: CategoryController.kCategoryIcon,
              onDelete: () async {
                await context.read<CategoryCrud>().deleteCategory(id: id);
              },
            ),
          ],
        ),
      ),
    );
  }
}