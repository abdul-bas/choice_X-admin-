
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';

import 'package:choice_x_admin/screen/user/user_mgt/widgets/desk_top_table/desk_top_row.dart';
import 'package:choice_x_admin/screen/user/user_mgt/widgets/desk_top_table/table_header.dart';
import 'package:flutter/material.dart';
class UserDesktopTable extends StatelessWidget {
  const UserDesktopTable({
    super.key,
    required this.users,
    required this.isTablet,
  });

  final List<UserModel> users;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    
         
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            border: Border.all(color: AppColors.surface),
            color: AppColors.sellerSurface,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: const Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
           
              SizedBox(width: 12),
              Expanded(flex: 3,
                child: UserTableHeader('NAME')),
              
              Expanded(flex: 3,
                child: UserTableHeader('EMAIL')),
              Expanded(flex: 5,
                child: SizedBox(
                  width: 160,
                  child: UserTableHeader('UID'),
                ),
              ),
              Expanded(flex: 1,
                child: SizedBox(
                  width: 72,
                  child: UserTableHeader('ACTION'),
                ),
              ),
            ],
          ),
        ),
    
        const SizedBox(height: 8),
    
    
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              color: AppColors.sellerSurface,
            ),
         
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, i) {
                return UserDesktopRow(user: users[i]);
              },
            ),
          ),
        ),
      ],
    );
  }
}