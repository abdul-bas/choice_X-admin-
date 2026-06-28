import 'package:choice_x_admin/core/constants/side_view.dart';
import 'package:choice_x_admin/state/provider/dashbord_sideview.dart';
import 'package:choice_x_admin/core/widgets/side_menu_bar/side_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminDashbord extends StatelessWidget {
  AdminDashbord({super.key});
  final ValueNotifier<int> sideBarIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashbordSideview>(
      builder:(context, value, child)  {
        return LayoutBuilder(builder: (context, constraints) {
          final width = constraints.maxWidth;
                
         final bool isMobile = width < 600;
                final bool isTablet = width >= 600 && width < 900;
                final bool isDesktop = width >= 1100;
          return Scaffold(
          
            drawer: SideMenuBar(
              sideBarIndex: sideBarIndex,
              value: value.index,isDrawer: true,
              isMobile: constraints.maxWidth<600,
            ),
            body: Row(
              children: [
                constraints.maxWidth > 700
                    ? SideMenuBar(
                        sideBarIndex: sideBarIndex,
                        value: value.index,isDrawer: false,
                       isMobile:  constraints.maxWidth<600
                      )
                    : SizedBox(),
                Expanded(
                  child: SizedBox.expand(
                      child: sidebarNavLinks[value.index]
                              ['navigation'](isDesktop,isMobile,isTablet) ??
                          SizedBox()),
                ),
              ],
            ),
          );
        });
      }
    );
  }
}

