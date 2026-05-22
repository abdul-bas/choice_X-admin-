
import 'package:choice_x_admin/screen/brand/common/actions/actions.dart';
import 'package:choice_x_admin/screen/brand/common/brand_dialog_shell/brand_dialog_shell.dart';
import 'package:choice_x_admin/screen/brand/common/header/header.dart';
import 'package:choice_x_admin/screen/brand/common/image_picker/image_picker.dart';
import 'package:choice_x_admin/screen/brand/common/name_field/name_field.dart';
import 'package:choice_x_admin/screen/common/app_widgets/app_loading.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:choice_x_admin/core/utils/snackbar/error_snackbar.dart';
import 'package:choice_x_admin/core/utils/snackbar/success_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBrandScreen extends StatelessWidget {
  const AddBrandScreen({super.key});

  Future<void> _submit(BuildContext context) async {
    final provider = context.read<BrandProvider>();

    if (provider.image == null) {
      showError(context, 'Please select a logo image');
      return;
    }

    final success = await provider.createBrand();
    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context);
      showSuccess(context, 'Brand created successfully');
    } else {
      showError(context, 'Failed to create brand');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BrandProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const BrandDialogShell(child: AppLoading());
        }

        return BrandDialogShell(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: provider.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandHeader(),
                  const SizedBox(height: 24),
                  BrandImagePicker(
                    bytes: provider.imageBytes,
                    onTap: provider.fileUpload,
                  ),
                  const SizedBox(height: 20),
                  BrandNameField(controller: provider.nameController),
                  const SizedBox(height: 24),
                  BrandActions(onSubmit: () => _submit(context)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}