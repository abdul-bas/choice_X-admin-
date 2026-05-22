import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/common/avatar_row.dart';
import 'package:choice_x_admin/screen/user/user_view/user_view_page.dart';
import 'package:choice_x_admin/core/utils/helpers/get_user_avatar_color.dart';
import 'package:flutter/material.dart';

class UserDesktopRow extends StatelessWidget {
  const UserDesktopRow({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final Color color = getUserAvatarColor(user);

    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(),
      child: Row(
        children: [
        
          const SizedBox(width: 12),
          Expanded(flex:3 ,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [  UserAvatar(name: user.name, color: color, size: 32, radius: 9), const SizedBox(width: 12),
                Text(user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Expanded(flex: 3,
            child: Text(user.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.38), fontSize: 12)),
          ),
          Expanded(flex: 5,
            child: SizedBox(
              width: 160,
              child: Text(user.uid ?? '—',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.2),
                      fontSize: 10,
                      fontFamily: 'monospace')),
            ),
          ),
          Expanded(flex: 1,
            child: SizedBox(
              width: 72,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => UserViewPage(user: user),
                  );
                },
                child: Container(
                  height: 26,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                      width: 0.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text('View',
                      style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.4),
                          fontSize: 11,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
