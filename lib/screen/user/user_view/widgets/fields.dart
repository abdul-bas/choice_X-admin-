import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/screen/user/user_view/widgets/user_fields_widget.dart';
import 'package:flutter/material.dart';

Widget buildUserFieldsWidgets(UserModel user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 18, 22, 20),
      child: Column(
        children: [
          UserFieldsWidget(
            icon: Icons.person_outline_rounded,
            label: 'Full name',
            value: user.name,
          ),
          const SizedBox(height: 10),
          UserFieldsWidget(
            icon: Icons.email_outlined,
            label: 'Email address',
            value: user.email,
          ),
          const SizedBox(height: 10),
          UserFieldsWidget(
            icon: Icons.lock_outline_rounded,
            label: 'User ID',
            value: user.uid ?? '—',
            mono: true,
          ),
        ],
      ),
    );
  }