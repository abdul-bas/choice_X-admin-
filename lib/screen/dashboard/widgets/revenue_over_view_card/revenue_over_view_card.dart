import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/empty_state/empty_state.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/revenue_over_view_card/widgets/bottom_title_widget.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/revenue_over_view_card/widgets/empty_chart_state.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/revenue_over_view_card/widgets/left_title_widgets.dart';
import 'package:choice_x_admin/core/utils/helpers/format_compact_number.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({
    super.key,
    required this.isDesk,
    required this.spots,
    this.useAspectRatio = true,
    Color? mainLineColor,
    Color? belowLineColor,
    Color? aboveLineColor,
  })  : mainLineColor = mainLineColor ?? AppColors.white,
        belowLineColor = belowLineColor ??
            AppColors.sellerAccentGreen.withValues(alpha: 0.1),
        aboveLineColor =
            aboveLineColor ?? AppColors.danger.withValues(alpha: 0.2);

  final bool isDesk;
  final List<FlSpot> spots;
  final bool useAspectRatio;
  final Color mainLineColor;
  final Color belowLineColor;
  final Color aboveLineColor;

  @override
  Widget build(BuildContext context) {
  
    final orderProv = context.read<OrderDetailsProvider>();
    
    final validSpots = spots.where((e) => e.y.isFinite).toList();

    if (validSpots.isEmpty) {
      return useAspectRatio
          ? AspectRatio(
              aspectRatio: isDesk ? 2 : 1.79,
              child: EmptyRevenueState(),
            )
          : EmptyRevenueState();
    }

    const cutOffY = 5.0;
    final maxY = spots.map((e) => e.y).reduce((a, b) => a > b ? a : b);
    final interval = maxY / 5;

    final content = Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LineChart(
              LineChartData(
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: maxY,
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (spots) => spots
                        .map(
                          (s) => LineTooltipItem(
                            formatNumber(s.y),
                            const TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 1.5,
                    preventCurveOverShooting: true,
                    color: AppColors.white38,
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.brand.withValues(alpha: 0.2),
                      cutOffY: cutOffY,
                      applyCutOffY: true,
                    ),
                    aboveBarData: BarAreaData(
                      show: true,
                      color: aboveLineColor,
                      cutOffY: cutOffY,
                      applyCutOffY: true,
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitleWidgets,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: interval,
                      reservedSize: 52,
                      getTitlesWidget: (v, m) =>
                          leftTitleWidgets(v, m, formatNumber),
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: interval,
                  getDrawingHorizontalLine: (_) => FlLine(
                    strokeWidth: 2,
                    gradient: LinearGradient(colors: [
                      AppColors.sellerSurfaceInput,
                      AppColors.sellerBorder,
                      AppColors.sellerBorder,
                      AppColors.sellerBorder,
                      AppColors.sellerSurfaceInput,
                    ]),
                  ),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ],
      ),
    );

    return useAspectRatio
        ? AspectRatio(aspectRatio: isDesk ? 2 : 1.79, child: content)
        : content;
  }
}
