import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/widgets/admin_dashbord/admin_dashbord.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/wide_layout/error_banner.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/common/field.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/common/field_group.dart';
import 'package:choice_x_admin/screen/admin_access/widgets/common/submit_button.dart';
import 'package:choice_x_admin/state/provider/admin_access_ui_provider.dart';
import 'package:choice_x_admin/state/provider/admin_auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.onLogin});
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final isAuthenticated =
        context.select<AdminAuthProvider, bool>((p) => p.isAuthenticated);
    final isLoading =
        context.select<AdminAuthProvider, bool>((p) => p.isLoading);
    final errorMessage =
        context.select<AdminAuthProvider, String?>((p) => p.errorMessage);
    final ui = context.watch<AdminAccessUiProvider>();

    if (isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => AdminDashbord()),
          (route) => false,
        );
      });
    }

    return Form(
      key: ui.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          const Text(
            'Good to see you.',
            style: TextStyle(
              color: AppColors.sellerHeading,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Sign in to continue to the admin panel.',
            style: TextStyle(
              color: AppColors.sellerSubtitle,
              fontSize: 13.5,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 36),

       
          FieldGroup(
            label: 'Email',
            child: Field(
              controller: ui.emailCtrl,
              hint: 'you@company.com',
              icon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.isEmpty) return 'Email is required';
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v))
                  return 'Enter a valid email';
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),

      
          FieldGroup(
            label: 'Password',
            child: Selector<AdminAccessUiProvider, bool>(
              selector: (_, p) => p.obscurePassword,
              builder: (ctx, obscure, _) => Field(
                controller: ui.passwordCtrl,
                hint: 'Enter password',
                icon: Icons.lock_outline_rounded,
                obscure: obscure,
                suffixIcon: GestureDetector(
                  onTap: () =>
                      ctx.read<AdminAccessUiProvider>().togglePasswordVisibility(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 17,
                      color: AppColors.sellerWhite10,
                    ),
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Password is required';
                  if (v.length < 6) return 'Minimum 6 characters';
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 28),

       
          if (errorMessage != null && errorMessage != 'Admin login successful') ...[
            ErrorBanner(errorMessage),
            const SizedBox(height: 20),
          ],

         
          SubmitButton(isLoading: isLoading, onPressed: onLogin),
          const SizedBox(height: 32),

          Row(
            children: [
              const Expanded(
                child: Divider(color: AppColors.sellerWhite10, thickness: 1),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'ChoiceX Seller Central',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 11,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(color: AppColors.sellerWhite10, thickness: 1),
              ),
            ],
          ),
          const SizedBox(height: 16),

       
          Center(
            child: Text(
              '© ${DateTime.now().year} · Authorised access only',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}