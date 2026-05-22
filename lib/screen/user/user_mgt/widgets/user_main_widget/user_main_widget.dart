import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/desk_top_table/desk_top_table.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/mobile_view/mbile_list.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/stat_card_row/user_stat_card.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMainWidget extends StatelessWidget {
  const UserMainWidget({
    super.key,
    required this.isMobile,
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.isTab,
  });

  final bool isMobile;
  final int crossAxisCount;
  final double childAspectRatio;
  final bool isTab;

  @override
  Widget build(BuildContext context) {
    return Selector<UserMgtProvider, List<UserModel>>(
      selector: (_, p) => p.users,
      builder: (_, users, __) {
        return Container(
          margin: isMobile ? null : const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
            child: users.isEmpty
                ? Center(
                    child: EmptyStates.search(null),
                  )
                : isMobile
                    ? Consumer2<UserMgtProvider, OrderDetailsProvider>(
                        builder: (context, userValue, orderValue, _) {
                          return UserMobileList(
                            users: users,
                            statsHeader: GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: childAspectRatio,
                              children: [
                                UserStatCard(
                                  label: 'TOTAL USERS',
                                  value: userValue.totalUser.toDouble(),
                                  accentColor: AppColors.totalSellers,
                                  footer: 'All registered users',
                                  isMobile: isMobile,
                                  icon: Icons.groups_rounded,
                                ),
                                UserStatCard(
                                  label: 'ACTIVE USERS',
                                  value: orderValue.activeUsers.toDouble(),
                                  accentColor: AppColors.activeSellers,
                                  footer: 'Currently active users',
                                  isMobile: isMobile,
                                  icon: Icons.check_circle_rounded,
                                ),
                                UserStatCard(
                                  label: 'INACTIVE USERS',
                                  value: orderValue.inActiveUsers.toDouble(),
                                  accentColor: AppColors.suspended,
                                  footer: 'Users not active',
                                  isMobile: isMobile,
                                  icon: Icons.cancel_rounded,
                                ),
                                UserStatCard(
                                  label: 'RECENT USERS',
                                  value: userValue.last7DaysUsers.toDouble(),
                                  accentColor: AppColors.pending,
                                  footer: 'Joined in last 7 days',
                                  isMobile: isMobile,
                                  icon: Icons.trending_up_rounded,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          Consumer2<UserMgtProvider, OrderDetailsProvider>(
                            builder: (context, userValue, orderValue, _) {
                              return GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: childAspectRatio,
                                children: [
                                  UserStatCard(
                                    label: 'TOTAL USERS',
                                    value: userValue.totalUser.toDouble(),
                                    accentColor: AppColors.totalSellers,
                                    footer: 'All registered users',
                                    isMobile: isMobile,
                                    icon: Icons.groups_rounded,
                                  ),
                                  UserStatCard(
                                    label: 'ACTIVE USERS',
                                    value: orderValue.activeUsers.toDouble(),
                                    accentColor: AppColors.activeSellers,
                                    footer: 'Currently active users',
                                    isMobile: isMobile,
                                    icon: Icons.check_circle_rounded,
                                  ),
                                  UserStatCard(
                                    label: 'INACTIVE USERS',
                                    value: orderValue.inActiveUsers.toDouble(),
                                    accentColor: AppColors.suspended,
                                    footer: 'Users not active',
                                    isMobile: isMobile,
                                    icon: Icons.cancel_rounded,
                                  ),
                                  UserStatCard(
                                    label: 'RECENT USERS',
                                    value: userValue.last7DaysUsers.toDouble(),
                                    accentColor: AppColors.pending,
                                    footer: 'Joined in last 7 days',
                                    isMobile: isMobile,
                                    icon: Icons.trending_up_rounded,
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: UserDesktopTable(
                              users: users,
                              isTablet: isTab,
                            ),
                          ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}
