import 'package:choice_x_admin/model/brand_model/brand_model.dart';
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

class UpdateBrand extends StatefulWidget {
  const UpdateBrand({super.key, required this.brand, required this.index});

  final BrandModel brand;
  final int index;

  @override
  State<UpdateBrand> createState() => _UpdateBrandState();
}

class _UpdateBrandState extends State<UpdateBrand> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BrandProvider>().populate(widget.brand);
    });
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
                  const BrandHeader(
                    title: 'Edit Brand',
                    subtitle: 'Edit logo and update the brand name.',
                    icon: Icons.edit_outlined,
                  ),
                  const SizedBox(height: 24),
                  BrandImagePicker(
                    bytes: provider.imageBytes,
                    onTap: provider.fileUpload,
                  ),
                  const SizedBox(height: 20),
                  BrandNameField(controller: provider.nameController),
                  const SizedBox(height: 24),
                  BrandActions(
                    onSubmit: () => BrandContoller.updateBrand(
                        context, widget.brand.id, widget.index),
                    actionTitle: 'Update Brand',
                    actionIcon: Icons.update,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
