import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/seller_detail_view.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/desk_top_view/desk_top_seller_row.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/desk_top_view/header_row.dart';
import 'package:flutter/material.dart';

class SellerDesktopView extends StatelessWidget {
  const SellerDesktopView({
    super.key,
    required this.sellers,
    required this.isTablet,
  });

  final List<SellerModel> sellers;
  final bool              isTablet;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
             
          Container(
            decoration: const BoxDecoration(
              color: AppColors.sellerSurface,
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: SellerHeaderRow(isTablet: isTablet),
          ),
          const SizedBox(height: 8),
      
       
          Expanded(
            child: ClipRRect( borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16)),
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                decoration: const BoxDecoration(
                  color: AppColors.sellerSurface,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16)),
                ),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: sellers.length,
                  itemBuilder: (context, i) {
                    final seller = sellers[i];
                    return InkWell(
                      onTap: () => showDialog(
                        context: context,
                        builder: (_) =>
                            SellerDetailViewPage(seller: seller),
                      ),
                      child: SellerDesktopRow(
                        seller: seller,
                        isTablet: isTablet,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}