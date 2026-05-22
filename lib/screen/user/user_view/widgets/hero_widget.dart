
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:flutter/material.dart';

Widget buildUserHero(Color color, String initials, UserModel user) {
  return Container(
    padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.white.withValues(alpha: 0.06),
          width: 0.5,
        ),
      ),
    ),
    child: Column(
      children: [
        // Avatar
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            color:AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: color.withValues(alpha: 0.2),
              width: 0.5,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            initials,
            style: TextStyle(
              color: color,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 14),

        Text(
          user.name,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),

        Text(
          user.uid ?? '—',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.white.withValues(alpha: 0.5),
            fontSize: 10,
            fontFamily: 'monospace',
          ),
        ),
      ],
    ),
  );
}
