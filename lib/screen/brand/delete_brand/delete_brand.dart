import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/actions.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/header.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/preview.dart';
import 'package:choice_x_admin/screen/common/delete_card_widgets/warning.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DeleteBrandScreen extends StatelessWidget {
  DeleteBrandScreen({super.key, required this.id});

  final String id;
  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDeleteHeader(title: 'brand'),
              const SizedBox(height: 16),
              buildDeletePreview(
                id: id,
                title: 'Brand',
                icon: Icons.diamond_outlined,
              ),
              const SizedBox(height: 14),
              buildDeleteWarning(
                message:
                    'All products linked to this brand will lose their brand association.',
              ),
              const SizedBox(height: 24),
              buildDeleteActions(
                context: context,
                isLoading: _isLoading,
                title: 'brand',
                onDelete: () async {
                  await context.read<BrandCrud>().deleteBrand(id: id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}