import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/constants/side_view.dart';
import 'package:choice_x_admin/state/provider/dashbord_sideview.dart';
import 'package:choice_x_admin/core/dialogs/log_out_dialog.dart';
import 'package:choice_x_admin/core/widgets/side_menu_bar/log_out_widget.dart';
import 'package:choice_x_admin/core/widgets/side_menu_bar/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuBar extends StatelessWidget {
  const SideMenuBar({
    super.key,
    required this.sideBarIndex,
    required this.value,
    required this.isDrawer,
    required this.isMobile,
  });

  final ValueNotifier<int> sideBarIndex;
  final int value;
  final bool isDrawer;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: isMobile ? null : const EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius:
            isMobile ? null : const BorderRadius.all(Radius.circular(16)),
      ),
      child: Focus(
        autofocus: true,
        child: Column(
          children: [
            Container(
              height: 64,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.sellerBorder, width: 1),
                ),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: LogoMark(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'NAVIGATIONS',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                children: sidebarNavLinks.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final items = entry.value;
                  final bool isSelected = index == value;

                  return GestureDetector(
                    onTap: () {
                      context.read<DashbordSideview>().toggleIndex(index);
                      sideBarIndex.value = index;
                      if (isDrawer) Navigator.pop(context);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 46,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.white
                            : AppColors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            items['icon'] as IconData?,
                            size: 18,
                            color: isSelected
                                ? AppColors.sellerSurfaceDeep
                                : AppColors.white70,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              items['text'] as String? ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.sellerSurfaceDeep
                                    : AppColors.white70,
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            LogOut(onTap: () => showLogoutDialog(context)),
          ],
        ),
      ),
    );
  }
}
