import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/header/header.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/info_section/info_section.dart';
import 'package:choice_x_admin/screen/seller/seller_detail_view/widgets/meta_section/meta_section.dart';
import 'package:flutter/material.dart';

class SellerDetailViewPage extends StatelessWidget {
  const SellerDetailViewPage({super.key, required this.seller});

  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.sellerSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.sellerSurfaceDeep,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600,
            maxHeight: 560,
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSellerDetailsHeader(seller.status),
                const SizedBox(height: 20),
               Divider(
          height: 0.5,
          thickness: 0.5,
          color: Colors.white.withValues(alpha: 0.08),
        ),
                const SizedBox(height: 20),
                Expanded(child: buildSellerDatailsInfoSection(seller)),
               Divider(
          height: 0.5,
          thickness: 0.5,
          color: Colors.white.withValues(alpha: 0.08),
        ),
                const SizedBox(height: 16),
                buildMetaSection(seller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}

