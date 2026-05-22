
  import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/widgets/app_bar/add_button.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/screen/brand/add_brand/add_brand.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:flutter/material.dart';

Widget buildAppBar(BuildContext context, BrandProvider provider, bool isMobile) {
    return UniversalAppBar(
      onSearchClose: provider.clearSearch,
      isMobile: isMobile,
      searchOpen: provider.searchOpen,
      searchFocus: provider.searchFocus,
      searchCtrl: provider.searchCtrl,
      onSearch: provider.searchFilter,
      config: AppBarConfigs.coupons,
      addButton: AppBarAddBtn(
        label: '+ Add brand',
        accent: AppColors.primary,
        onTap: () => showDialog(
          context: context,
          builder: (_) => const AddBrandScreen(),
        ),
      ),
      searchButton: AppBarSearchIconBtn(
        isActive: !provider.searchOpen,
        onTap: provider.toggleSearch,
      ),
    );
  }