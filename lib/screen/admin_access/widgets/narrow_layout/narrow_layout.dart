

import 'package:choice_x_admin/screen/admin_access/widgets/common/right_panel.dart';
import 'package:flutter/material.dart';

class NarrowLayout extends StatelessWidget {
  final VoidCallback onLogin;
  const NarrowLayout({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      
        Expanded(child: RightPanel(onLogin: onLogin)),
      ],
    );
  }
}
