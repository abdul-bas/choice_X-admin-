
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/narrow_layout/narrow_layout.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/wide_layout/wide_layout.dart';
import 'package:choice_x_admin/state/provider/admin_access_ui_provider.dart';
import 'package:choice_x_admin/state/provider/admin_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminAccess extends StatelessWidget {
  const AdminAccess({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w >= 860;
    final ui = context.read<AdminAccessUiProvider>();
    final auth = context.read<AdminAuthProvider>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: isWide
          ? WideLayout(onLogin: () async {
              if (!ui.formKey.currentState!.validate()) return;
              await auth.adminAccess(
                email: ui.emailCtrl.text.trim(),
                password: ui.passwordCtrl.text.trim(),
              );
              auth.clear();
              ui.clear();
            })
          : NarrowLayout(onLogin: () async {
              if (!ui.formKey.currentState!.validate()) return;
              await auth.adminAccess(
                email: ui.emailCtrl.text.trim(),
                password: ui.passwordCtrl.text.trim(),
              );
              ui.clear();
              auth.clear();
            }),
    );
  }
}
