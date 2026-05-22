import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/controller/order_controller.dart';
import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/services/firestore_service/handle_list_snapshot.dart';
import 'package:choice_x_admin/screen/orders/widgets/desk_top_view/desk_top_view.dart';
import 'package:choice_x_admin/screen/orders/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class OrderScreen extends StatelessWidget {
  OrderScreen({
    super.key,
    required this.isDeskTop,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isDeskTop;
  final bool isTab;

  
  final OrdersLogic _logic = OrdersLogic();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _logic.readOrders(),
      builder: (context, snapshot) {
        final state = handleListSnapshot(snapshot: snapshot);
        if (state != null) return state;

        if (!snapshot.hasData) return EmptyStates.orders();

       
        _logic.syncToProvider(context, snapshot);

        return Column(
          children: [
            Consumer<OrderDetailsProvider>(
              builder: (context, value, _) {
                return UniversalAppBar(
                  onSearchClose: value.clearSearch,
                  isMobile: isMobile,
                  searchOpen: value.searchOpen,
                  searchFocus: value.searchFocus,
                  searchCtrl: value.searchCtrl,
                  onSearch: value.searchFilter,
                  config: AppBarConfigs.orders,
                  searchButton: AppBarSearchIconBtn(
                    isActive: !value.searchOpen,
                    onTap: value.toggleSearch,
                  ),
                );
              },
            ),
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
                child: Container(
                 padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.sellerSurfaceDeep,
                              borderRadius: BorderRadius.circular(16),
                            ),
                  child: ClipRRect(
                    borderRadius: isMobile
                        ? BorderRadius.zero
                        : BorderRadius.circular(16),
                    child: Selector<OrderDetailsProvider, List<OrderModel>>(
                      selector: (_, provider) => provider.filtered,
                      builder: (context, filteredOrders, _) {
                        if (filteredOrders.isEmpty) {
                          return EmptyStates.search(null);
                        }
                        return isMobile
                            ? OrderMobileView(
                                filteredOrders: filteredOrders,
                                logic: _logic,
                                isTab: isTab,
                              )
                            : OrderDesktopView(
                                filteredOrders: filteredOrders,
                                logic: _logic,
                                isTablet: isTab,
                                isTab: isTab,
                              );
                      },
                    ),
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


