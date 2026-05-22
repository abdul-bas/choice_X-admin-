 import 'package:choice_x_admin/core/constants/user_table_head_text.dart';

import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:flutter/material.dart';

class SellerHeaderRow extends StatelessWidget {
  const SellerHeaderRow({super.key, required this.isTablet});
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...userTableColumns.map(
            (col) => Expanded(
              flex: col['flex'] as int,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12, horizontal: 8),
                child: TextInter(
                  text: col['label'] as String,
                  letterSpacing: 0.5,
                  wordSpace: 0.5,
                  fontSize: isTablet ? 10 : 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}