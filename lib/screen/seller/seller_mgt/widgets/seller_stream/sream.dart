import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/services/firestore_service/handle_snapshot.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_management.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SellerStreamWrapper extends StatelessWidget {
  const SellerStreamWrapper({
    super.key,
    required this.isMobile,
    required this.child,
  });

  final bool isMobile;

  final Widget Function(
    BuildContext context,
    List<SellerModel> sellers,
  ) child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SellerManagement().getSellerData(),
      builder: (context, snapshot) {

        final state = handleSnapshot(snapshot);

        if (state != null) {
          return state;
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return EmptyStates.sellers();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<SellerMgtProvider>().setSellers(
                snapshot: snapshot,
              );
        });

        return Selector<SellerMgtProvider, List<SellerModel>>(
          selector: (_, provider) => provider.filtered,
          builder: (context, sellers, _) {

            if (sellers.isEmpty) {
              return EmptyStates.search(
                context.read<SellerMgtProvider>().searchCtrl.text,
              );
            }

            return Container(
              margin: isMobile
                  ? null
                  : const EdgeInsets.fromLTRB(10, 0, 10, 10),

              padding: isMobile
                  ? null
                  : const EdgeInsets.all(15),

              decoration: isMobile
                  ? null
                  : BoxDecoration(
                      color: AppColors.sellerSurface,
                      borderRadius: BorderRadius.circular(16),
                    ),

              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.sellerSurfaceDeep,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: child(context, sellers),
              ),
            );
          },
        );
      },
    );
  }
}