import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/constants/months.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  final index = value.toInt();
  if (index < 0 || index > 11) return const SizedBox();

  final currentMonthIndex = DateTime.now().month - 1;
  final shiftedIndex = ((currentMonthIndex - 11 + index) % 12 + 12) % 12;

  return SideTitleWidget(
    meta:  meta,
    space: 10,
    child: Text(
      months[shiftedIndex],
      style: const TextStyle(
        color:      AppColors.white70,
        fontWeight: FontWeight.bold,
        fontSize:   11,
      ),
    ),
  );
}
