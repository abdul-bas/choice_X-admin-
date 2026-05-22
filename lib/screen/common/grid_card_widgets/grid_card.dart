import 'dart:convert';
import 'dart:typed_data';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/common/grid_card_widgets/action_button.dart';
import 'package:choice_x_admin/screen/common/grid_card_widgets/cat_image.dart';
import 'package:choice_x_admin/screen/common/grid_card_widgets/delete_icon_button.dart';
import 'package:flutter/material.dart';

Widget buildGridCard(BuildContext context, dynamic data,
    {required VoidCallback onDelete, required VoidCallback onEdit}) {
  final Uint8List? bytes =
      data.image.isNotEmpty ? base64Decode(data.image) : null;

  return Container(
    decoration: BoxDecoration(
      color: AppColors.sellerSurface,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: AppColors.border,
        width: 0.5,
      ),
    ),
    clipBehavior: Clip.hardEdge,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: CatImage(bytes: bytes),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  data.id,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.22),
                    fontSize: 10,
                    fontFamily: 'monospace',
                  ),
                ),
                const Spacer(),

               
                Row(
                  children: [
                    Expanded(
                      child: ActionBtn(
                          label: 'Edit',
                          icon: Icons.edit_outlined,
                          color: Colors.white.withValues(alpha: 0.45),
                          bgColor: Colors.white.withValues(alpha: 0.04),
                          borderColor: Colors.white.withValues(alpha: 0.08),
                          onTap: onEdit),
                    ),
                    const SizedBox(width: 6),
                    DeleteIconBtn(onTap: onDelete),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
