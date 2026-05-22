
  import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/mobile_seller_card.dart';
import 'package:flutter/material.dart';


class SellerMobileView extends StatelessWidget {
  const SellerMobileView({
    super.key,
    required this.sellers,
    required this.statsSection,
  });

  final List<SellerModel> sellers;
  final Widget statsSection;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     
      itemCount: sellers.length + 1,
      separatorBuilder: (_, i) => i == 0
          ? const SizedBox(height: 10) 
          : const SizedBox(height: 12),
      itemBuilder: (_, i) {
        if (i == 0) return statsSection;
        return SellerMobileCard(seller: sellers[i - 1]);
      },
    );
  }
}