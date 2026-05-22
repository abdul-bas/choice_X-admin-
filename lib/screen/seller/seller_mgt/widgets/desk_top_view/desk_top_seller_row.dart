import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/controller/controller.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/seller_btn.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_mgt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerDesktopRow extends StatelessWidget {
  const SellerDesktopRow({
    super.key,
    required this.seller,
    required this.isTablet,
  });

  final SellerModel seller;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final fontSize = isTablet ? 10.0 : 12.0;
    final statusColor = SellerController.statusColor(seller.status);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 35,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextInter(
                    text: seller.userName,
                    maxLines: 1,
                    overFlow: TextOverflow.ellipsis,
                    letterSpacing: 0.5,
                    wordSpace: 0.5,
                    fontWeight: FontWeight.w300,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: TextInter(
                text: seller.phoneNumber,
                letterSpacing: 0.5,
                wordSpace: 0.5,
                fontWeight: FontWeight.w300,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: TextInter(
                text: seller.email,
                letterSpacing: 0.5,
                maxLines: 1,
                overFlow: TextOverflow.ellipsis,
                wordSpace: 0.5,
                fontWeight: FontWeight.w300,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: TextInter(
                text: seller.status,
                color: statusColor,
                letterSpacing: 0.5,
                wordSpace: 0.5,
                fontWeight: FontWeight.w300,
                fontSize: fontSize,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 25,
                      width: isTablet ? 80 : 100,
                      child: SellerActionButton.accept(
                        onTap: () => context
                            .read<SellerMgt>()
                            .statusChange('approved', seller.uid!),
                      ),
                    ),
                  ),
                  SizedBox(width: isTablet ? 10 : 15),
                  Flexible(
                    child: SizedBox(
                      height: 25,
                      width: isTablet ? 80 : 100,
                      child: SellerActionButton.reject(
                        onTap: () => context
                            .read<SellerMgt>()
                            .statusChange('reject', seller.uid!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
