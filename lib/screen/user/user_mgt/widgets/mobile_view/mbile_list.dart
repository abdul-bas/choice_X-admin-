
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/mobile_view/mobile_card.dart';
import 'package:flutter/material.dart';




class UserMobileList extends StatelessWidget {
  const UserMobileList({
    super.key,
    required this.users,
    required this.statsHeader,
  });

  final List<UserModel> users;
  final Widget statsHeader;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      
     
      itemCount: users.length + 1, 
      separatorBuilder: (_, i) => SizedBox(height: i == 0 ? 10 : 12),
      itemBuilder: (_, i) {
        if (i == 0) return statsHeader;
        return UserMobileCard(user: users[i - 1]);
      },
    );
  }
}