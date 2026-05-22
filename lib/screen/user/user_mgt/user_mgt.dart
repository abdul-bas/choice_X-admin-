import 'package:choice_x_admin/state/db/seller_mgt/user_management.dart';
import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/core/widgets/app_bar/search_icon_button.dart';
import 'package:choice_x_admin/screen/common/app_widgets/app_loading.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/user_main_widget/user_main_widget.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:choice_x_admin/core/utils/empty_states/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserMgtScreen extends StatelessWidget {
  const UserMgtScreen({
    super.key,
    required this.isDeskTop,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDeskTop;

  @override
  Widget build(BuildContext context) {
    final int crossAxisCount = isDeskTop ? 4 : 2;
    final double childAspectRatio = isDeskTop ? 2.5 : 2;
    return StreamBuilder(
      stream: UserManagement().getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppLoading(message: 'Loading users');
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.5),
                fontSize: 14,
              ),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return EmptyStates.search('users');
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            context.read<UserMgtProvider>().setUsers(snapshot);
          }
        });

        return Column(
          children: [
            Consumer<UserMgtProvider>(
              builder: (_, p, __) => UniversalAppBar(
                onSearchClose: p.clearSearch,
                isMobile: isMobile,
                searchOpen: p.searchOpen,
                searchFocus: p.searchFocus,
                searchCtrl: p.searchController,
                onSearch: p.searchFilter,
                config: AppBarConfigs.users,
                searchButton: AppBarSearchIconBtn(
                  isActive: !p.searchOpen,
                  onTap: p.toggleSearch,
                ),
              ),
            ),
            
                 Expanded(
                  child: UserMainWidget(
                      isMobile: isMobile,
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      isTab: isTab),
                ),
          ],
        );
      },
    );
  }
}
