import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/widgets/status_section/top_bar.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SellerStatsSection extends StatelessWidget {
  const SellerStatsSection({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Consumer<SellerMgtProvider>(
      builder: (context, provider, _) {
        final cards = [
          {
            'label': 'Total Sellers',
            'value': '${provider.totalSeller}',
            'footer': 'All registered',
            'icon': Icons.people_outline_rounded,
            'color': AppColors.totalSellers,
          },
          {
            'label': 'Active Sellers',
            'value': '${provider.activeSeller}',
            'footer': 'Currently active',
            'icon': Icons.check_circle_outline_rounded,
            'color': AppColors.activeSellers,
          },
          {
            'label': 'Pending',
            'value': '${provider.pendingSeller}',
            'footer': 'Awaiting review',
            'icon': Icons.schedule_rounded,
            'color': AppColors.pending,
          },
          {
            'label': 'Suspended',
            'value': '${provider.inActiveSeller}',
            'footer': 'Access restricted',
            'icon': Icons.block_rounded,
            'color': AppColors.suspended,
          },
        ];

        return isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SellerTopBar(
                          isMobile: true,
                          label: cards[0]['label'] as String,
                          value: cards[0]['value'] as String,
                          footer: cards[0]['footer'] as String,
                          icon: cards[0]['icon'] as IconData,
                          accentColor: cards[0]['color'] as Color,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SellerTopBar(
                          isMobile: true,
                          label: cards[1]['label'] as String,
                          value: cards[1]['value'] as String,
                          footer: cards[1]['footer'] as String,
                          icon: cards[1]['icon'] as IconData,
                          accentColor: cards[1]['color'] as Color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: SellerTopBar(
                          isMobile: true,
                          label: cards[2]['label'] as String,
                          value: cards[2]['value'] as String,
                          footer: cards[2]['footer'] as String,
                          icon: cards[2]['icon'] as IconData,
                          accentColor: cards[2]['color'] as Color,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SellerTopBar(
                          isMobile: true,
                          label: cards[3]['label'] as String,
                          value: cards[3]['value'] as String,
                          footer: cards[3]['footer'] as String,
                          icon: cards[3]['icon'] as IconData,
                          accentColor: cards[3]['color'] as Color,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: SellerTopBar(
                      isMobile: false,
                      label: cards[0]['label'] as String,
                      value: cards[0]['value'] as String,
                      footer: cards[0]['footer'] as String,
                      icon: cards[0]['icon'] as IconData,
                      accentColor: cards[0]['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SellerTopBar(
                      isMobile: false,
                      label: cards[1]['label'] as String,
                      value: cards[1]['value'] as String,
                      footer: cards[1]['footer'] as String,
                      icon: cards[1]['icon'] as IconData,
                      accentColor: cards[1]['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SellerTopBar(
                      isMobile: false,
                      label: cards[2]['label'] as String,
                      value: cards[2]['value'] as String,
                      footer: cards[2]['footer'] as String,
                      icon: cards[2]['icon'] as IconData,
                      accentColor: cards[2]['color'] as Color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SellerTopBar(
                      isMobile: false,
                      label: cards[3]['label'] as String,
                      value: cards[3]['value'] as String,
                      footer: cards[3]['footer'] as String,
                      icon: cards[3]['icon'] as IconData,
                      accentColor: cards[3]['color'] as Color,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
