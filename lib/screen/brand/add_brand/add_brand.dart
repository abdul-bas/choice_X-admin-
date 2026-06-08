
import 'package:choice_x_admin/screen/brand/common/actions/actions.dart';
import 'package:choice_x_admin/screen/brand/common/brand_dialog_shell/brand_dialog_shell.dart';
import 'package:choice_x_admin/screen/brand/common/header/header.dart';
import 'package:choice_x_admin/screen/brand/common/image_picker/image_picker.dart';
import 'package:choice_x_admin/screen/brand/common/name_field/name_field.dart';
import 'package:choice_x_admin/screen/brand/controller/brand_contoller.dart';
import 'package:choice_x_admin/screen/common/app_widgets/app_loading.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBrandScreen extends StatefulWidget {
  const AddBrandScreen({super.key});

  @override
  State<AddBrandScreen> createState() => _AddBrandScreenState();
}

class _AddBrandScreenState extends State<AddBrandScreen> {
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandProvider>().reset();
    });
    super.initState();
  }
  @override
  void dispose() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandProvider>().reset();
    });
    super.dispose();
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
                  BrandActions(onSubmit: () => BrandContoller.createBrand(context)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}