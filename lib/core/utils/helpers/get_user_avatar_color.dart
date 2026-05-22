
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/core/constants/avatar_colors.dart';

getUserAvatarColor(UserModel doc){
  return
      avatarColors[doc.name.hashCode.abs() % avatarColors.length];
}