import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/coupon/controller/read_controller.dart';
import 'package:choice_x_admin/state/provider/coupon_filter_provider.dart';
import 'package:choice_x_admin/services/firestore_service/handle_list_snapshot.dart';
import 'package:choice_x_admin/state/db/coupon/coupon.dart';
import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/widgets/app_bar/add_button.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/desk_top_view.dart/desk_top_view.dart';
import 'package:choice_x_admin/screen/coupon/read/widgets/tab_view.dart/tab_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: CouponCrud().readCoupon(),
      builder: (context, asyncSnapshot) {
        final state = handleListSnapshot(snapshot: asyncSnapshot);
        if (state != null) return state;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context
              .read<CouponFilterProvider>()
              .setCoupons(snapshot: asyncSnapshot);
        });

        final coupons = context.watch<CouponFilterProvider>().coupons;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth <= 880;

            return Stack(
              children: [
                Column(
                  children: [
                    Consumer<CouponFilterProvider>(
                      builder: (context, filterProv, _) => UniversalAppBar(
                        onSearchClose: () =>
                            context.read<CouponFilterProvider>().clearSearch(),
                        isMobile: isMobile,
                        searchOpen: filterProv.searchOpen,
                        searchFocus: filterProv.searchFocus,
                        searchCtrl: filterProv.searchCtrl,
                        onSearch: (v) => context
                            .read<CouponFilterProvider>()
                            .searchFilter(v),
                        config: AppBarConfigs.coupons,
                        addButton: AppBarAddBtn(
                          label: '+ Add coupon',
                          accent: AppColors.white,
                          onTap: () => ReadController.openAdd(context),
                        ),
                        searchButton: AppBarSearchIconBtn(
                          isActive: !filterProv.searchOpen,
                          onTap: () => context
                              .read<CouponFilterProvider>()
                              .toggleSearch(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: isMobile
                            ? null
                            : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        padding: isMobile ? null : const EdgeInsets.all(15),
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
                          child: constraints.maxWidth <= 1000
                              ? CouponTabletView(
                                  coupons: coupons,
                                  onEdit: (i) => ReadController.openEdit(
                                      context, coupons[i], i),
                                  onDelete: (i) => ReadController.openDelete(
                                      context, coupons[i], i),
                                )
                              : CouponDesktopView(
                                  coupons: coupons,
                                  onEdit: (i) => ReadController.openEdit(
                                      context, coupons[i], i),
                                  onDelete: (i) => ReadController.openDelete(
                                      context, coupons[i], i),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
