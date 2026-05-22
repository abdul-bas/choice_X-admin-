import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/common/avatar_row.dart';
import 'package:choice_x_admin/screen/user/user_view/user_view_page.dart';
import 'package:choice_x_admin/core/utils/helpers/get_user_avatar_color.dart';
import 'package:flutter/material.dart';

class UserMobileCard extends StatelessWidget {
  const UserMobileCard({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final Color color = getUserAvatarColor(user);

    return Container(
      padding: const EdgeInsets.fromLTRB(13, 12, 12, 12),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.07),
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          UserAvatar(name: user.name, color: color, size: 40, radius: 11),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(user.email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
                        fontSize: 11)),
                const SizedBox(height: 2),
                Text(user.uid ?? '—',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.18),
                        fontSize: 10,
                        fontFamily: 'monospace')),
              ],
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => UserViewPage(user: user,),
              );
            },
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.07),
                  width: 0.5,
                ),
              ),
              child: Icon(Icons.visibility_outlined,
                  size: 13, color: Colors.white.withValues(alpha: 0.35)),
            ),
          ),
        ],
      ),
    );
  }
}
