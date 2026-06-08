import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/brand/controller/brand_contoller.dart';
import 'package:choice_x_admin/screen/brand/read_brand/widgets/app_bar.dart';
import 'package:choice_x_admin/screen/brand/read_brand/widgets/content.dart';
import 'package:choice_x_admin/services/firestore_service/handle_snapshot.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({
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
    return Consumer<BrandCrud>(
      builder: (context, crud, _) {
        BrandContoller.showSnackbarIfNeeded(context, crud);

        return Column(
          children: [ Consumer<BrandProvider>(
            builder: (context, value, child) =>  buildAppBar(context, value, isMobile),
          ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: crud.readBrand(),
              builder: (context, snapshot) {
                final state = handleSnapshot(snapshot);
                if (state != null) return state;
            
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.read<BrandProvider>().setBrands(snapshot: snapshot);
                });
            
                return Consumer<BrandProvider>(
                  builder: (context, provider, _) {
                    if (provider.brands.isEmpty) {
                      return Expanded(
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
                                ),child: EmptyStates.brands())),
                      );
                    }
            
                    return buildContent(
                                      context,
                                      provider,
                                      isMobile,
                                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
