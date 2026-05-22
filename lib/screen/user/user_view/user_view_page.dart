import 'package:choice_x_admin/core/constants/app_colors.dart' show AppColors;
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_view/widgets/fields.dart';
import 'package:choice_x_admin/screen/user/user_view/widgets/footer.dart';
import 'package:choice_x_admin/screen/user/user_view/widgets/hero_widget.dart';
import 'package:choice_x_admin/core/utils/helpers/avadar_color.dart';
import 'package:choice_x_admin/core/utils/helpers/get_initials.dart';
import 'package:flutter/material.dart';

class UserViewPage extends StatelessWidget {
  const UserViewPage({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final Color color = getAvatarColor(user.name);
    final String initials = getInitials(user.name);

    return Dialog(
      backgroundColor:  AppColors.sellerSurface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container( margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.sellerSurfaceDeep,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildUserHero(color, initials, user),
              buildUserFieldsWidgets(user),
              builUserFooter(
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
