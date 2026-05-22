

  import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:choice_x_admin/screen/brand/delete_brand/delete_brand.dart';
import 'package:choice_x_admin/screen/brand/update_brand/update_brand.dart';
import 'package:choice_x_admin/screen/common/grid_card_widgets/grid_card.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:flutter/material.dart';

Widget buildContent(BuildContext context, BrandProvider provider, bool isMobile) {
    final Widget grid = provider.filtered.isEmpty
        ? EmptyStates.search(provider.searchCtrl.text)
        : Padding(
      padding: isMobile ? const EdgeInsets.all(8) : EdgeInsets.zero,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          mainAxisExtent: 250,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: provider.filtered.length,
        itemBuilder: (_, i) {
          final brand = provider.filtered[i];
          return buildGridCard(
            context,
            brand,
            onDelete: () => showDialog(
              context: context,
              builder: (_) => DeleteBrandScreen(id: brand.id),
            ),
            onEdit: () => showDialog(
              context: context,
              builder: (_) => UpdateBrand(brand: brand, index: i),
            ),
          );
        },
      ),
    );

    if (isMobile) return grid;

    return Container(margin: isMobile
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
      child: Container(
        padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.sellerSurfaceDeep,
                              borderRadius: BorderRadius.circular(16),
                            ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: grid,
        ),
      ),
    );
  }
