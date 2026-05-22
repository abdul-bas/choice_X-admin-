import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/core/constants/avatar_colors.dart';

getSellerAvatarColor(SellerModel doc){
  return
      avatarColors[doc.userName.hashCode.abs() % avatarColors.length];
}