import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


Widget leftTitleWidgets(
  double value,
  TitleMeta meta,
  String Function(double) formatter,
) {
  if (value == meta.max || value == 0) return const SizedBox();
  return SideTitleWidget(
    meta:  meta,
    space: 6,
    child: Text(
      formatter(value),
      textAlign: TextAlign.right,
      style: const TextStyle(
        color:      AppColors.white70,
        fontWeight: FontWeight.bold,
        fontSize:   11,
      ),
    ),
  );
}