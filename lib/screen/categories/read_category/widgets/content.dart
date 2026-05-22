
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:choice_x_admin/screen/categories/delete_category/delete_category.dart';
import 'package:choice_x_admin/screen/categories/edit_category/edit_category.dart';
import 'package:choice_x_admin/screen/common/grid_card_widgets/grid_card.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:flutter/material.dart';

Widget buildCategoryContent(BuildContext context, CategoryProvider provider, bool isMobile) {
  final Widget grid = provider.filtered.isEmpty
      ? EmptyStates.search(provider.searchCtrl.text)
      : GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4),
        gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisExtent: 250,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: provider.filtered.length,
        itemBuilder: (_, i) {
          final category = provider.filtered[i];
      
          return buildGridCard(
            context,
            category,
            onDelete: () => showDialog(
              context: context,
              builder: (_) =>
                  DeleteCategory(id: category.id),
            ),
            onEdit: () => showDialog(
              context: context,
              builder: (_) => UpdateCategory(
                category: category,
                index: i,
              ),
            ),
          );
        },
      );

  if (isMobile) return grid;

  return ClipRRect(
    borderRadius: const BorderRadius.all(
      Radius.circular(16),
    ),
    child: grid,
  );
}