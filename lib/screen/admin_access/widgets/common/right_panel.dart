

import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/common/login_form.dart';
import 'package:flutter/material.dart';

class RightPanel extends StatelessWidget {
  final VoidCallback onLogin;
  const RightPanel({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 48),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 380),
            child: LoginForm(onLogin: onLogin),
          ),
        ),
      ),
    );
  }
}