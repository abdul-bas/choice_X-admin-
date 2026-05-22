
import 'package:choice_x_admin/screen/admin_access/widgets/common/right_panel.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/wide_layout/left_panel.dart';
import 'package:flutter/material.dart';

class WideLayout extends StatelessWidget {
  final VoidCallback onLogin;
  const WideLayout({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    
        const SizedBox(width: 420, child: LeftPanel()),

        
        Expanded(
          child:RightPanel(onLogin: onLogin),
        ),
      ],
    );
  }
}