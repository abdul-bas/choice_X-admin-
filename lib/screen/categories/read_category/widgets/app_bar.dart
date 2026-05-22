import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/widgets/app_bar/add_button.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/screen/categories/add_category/add_category.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:flutter/material.dart';

  Widget buildCategoryAppBar(BuildContext context, CategoryProvider provider, bool isMobile) {
    return UniversalAppBar(
      onSearchClose: provider.clearSearch,
      isMobile: isMobile,
      searchOpen: provider.searchOpen,
      searchFocus: provider.searchFocus,
      searchCtrl: provider.searchCtrl,
      onSearch: provider.searchFilter,
      config: AppBarConfigs.categories,
      addButton: AppBarAddBtn(
        label: '+ Add category',
        accent: AppColors.primary,
        onTap: () => showDialog(
          context: context,
          builder: (_) => const CreateCategory(),
        ),
      ),
      searchButton: AppBarSearchIconBtn(
        isActive: !provider.searchOpen,
        onTap: provider.toggleSearch,
      ),
    );
  }
