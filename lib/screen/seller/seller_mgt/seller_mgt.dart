import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/desk_top_view/desk_top_view.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/status_section/status_section.dart';

import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_management.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerMgtScreen extends StatelessWidget {
  const SellerMgtScreen({
    super.key,
    required this.isDeskTop,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDeskTop;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SellerManagement().getSellerData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong.'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return EmptyStates.sellers();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<SellerMgtProvider>().setSellers(snapshot: snapshot);
        });

        return Column(
          children: [
            Consumer<SellerMgtProvider>(
              builder: (context, value, _) => UniversalAppBar(
                onSearchClose: value.clearSearch,
                isMobile: isMobile,
                searchOpen: value.searchOpen,
                searchFocus: value.searchFocus,
                searchCtrl: value.searchCtrl,
                onSearch: value.searchFilter,
                config: AppBarConfigs.sellers,
                searchButton: AppBarSearchIconBtn(
                  isActive: !value.searchOpen,
                  onTap: value.toggleSearch,
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
                  child: Selector<SellerMgtProvider, List<SellerModel>>(
                    selector: (_, p) => p.filtered,
                    builder: (context, sellers, _) {
                      if (sellers.isEmpty) {
                        return Center(child: EmptyStates.sellers());
                      }

                    
                      if (isMobile) {
                        return SellerMobileView(
                          sellers: sellers,
                          statsSection: const SellerStatsSection(isMobile: true),
                        );
                      }

                      
                      return Column(
                        children: [
                          const SellerStatsSection(isMobile: false),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SellerDesktopView(
                              isTablet: isTab,
                              sellers: sellers,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

