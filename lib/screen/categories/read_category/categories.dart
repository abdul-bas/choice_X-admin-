import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/categories/controller/category_controller.dart';
import 'package:choice_x_admin/screen/categories/read_category/widgets/app_bar.dart';
import 'package:choice_x_admin/screen/categories/read_category/widgets/content.dart';
import 'package:choice_x_admin/services/firestore_service/handle_snapshot.dart';
import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.isMobile,
    required this.isTab,
    required this.isDeskTop,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDeskTop;

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryCrud>(
      builder: (context, crud, _) {
        CategoryController.showCategorySnackbarIfNeeded(context, crud);

        return StreamBuilder(
          stream: crud.readCategory(),
          builder: (context, snapshot) {
            final state = handleSnapshot(snapshot);
            if (state != null) return state;

            WidgetsBinding.instance.addPostFrameCallback((_) {
              context
                  .read<CategoryProvider>()
                  .setCategories(snapshot: snapshot);
            });

            return Consumer<CategoryProvider>(
              builder: (context, provider, _) {
                if (provider.categories.isEmpty) {
                  return EmptyStates.categories();
                }

                return Column(
                  children: [
                    buildCategoryAppBar(context, provider, isMobile),
                    Expanded(
                        child: Container(margin: isMobile
                              ? null
                              : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding:
                              isMobile ? null : const EdgeInsets.all(15),
                          decoration: isMobile
                              ? null
                              : BoxDecoration(
                                  color: AppColors.sellerSurface,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                            child: Container(padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.sellerSurfaceDeep,
                              borderRadius: BorderRadius.circular(16),
                            ),
                                child: buildCategoryContent(
                                    context, provider, isMobile)))),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
