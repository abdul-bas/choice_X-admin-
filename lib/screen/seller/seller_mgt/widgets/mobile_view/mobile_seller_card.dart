import 'package:choice_x_admin/core/constants/app_colors.dart' show AppColors;
import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_mgt.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/contact_chip.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/seller_btn.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/mobile_view/status_chip.dart';
import 'package:choice_x_admin/core/utils/helpers/get_seller_avatar_color.dart';
import 'package:choice_x_admin/core/utils/helpers/get_initials.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerMobileCard extends StatelessWidget {
  const SellerMobileCard({
    super.key,
    required this.seller,
  });

  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    final color = getSellerAvatarColor(seller);
    final initials = getInitials(seller.userName);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.border,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: color.withValues(alpha: 0.2),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  initials,
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      seller.userName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      seller.uid ?? '—',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 10,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ContactChip(
                  icon: Icons.phone_outlined,
                  value: seller.phoneNumber,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ContactChip(
                  icon: Icons.email_outlined,
                  value: seller.email,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Application status',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 11,
                ),
              ),
              SellerStatusChip(
                status: seller.status,
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: SellerActionButton.accept(
                  onTap: () {
                    context.read<SellerMgt>().statusChange(
                          'approved',
                          seller.uid!,
                        );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: SellerActionButton.reject(
                  onTap: () {
                    context.read<SellerMgt>().statusChange(
                          'reject',
                          seller.uid!,
                        );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
