
import 'package:choice_x_admin/screen/dashboard/widgets/stat_card/delta_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/stat_card/arc_painter.dart';
import 'package:choice_x_admin/state/provider/arc_progress_provider.dart';
import 'package:choice_x_admin/core/utils/helpers/get_arc_progress.dart';

class DashBoardStatCard extends StatelessWidget {
  const DashBoardStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.accentColor,
    required this.progressKey,
    this.statusLabel = 'Active',
    this.arcSubLabel = 'active',
    this.delta,
  });

  final String  title;
  final String  value;
  final Color   accentColor;
  final String  progressKey;
  final String  statusLabel;
  final String  arcSubLabel;
  final String? delta;

  @override
  Widget build(BuildContext context) {
    return Consumer<ArcProgressProvider>(
      builder: (context, provider, _) {
        final double progress = getArcProgress(provider, progressKey);

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:        AppColors.sellerSurface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.sellerWhite10,
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
            
              SizedBox(
                width:  76,
                height: 76,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size:    const Size(76, 76),
                      painter: ArcPainter(
                        progress: progress,
                        color:    accentColor,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${progress.round()}%',
                          style: const TextStyle(
                            color:       AppColors.white,
                            fontSize:    13,
                            fontWeight:  FontWeight.w700,
                            letterSpacing: -0.5,
                            height:      1,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          arcSubLabel,
                          style: TextStyle(
                            color:      AppColors.white.withValues(alpha: 0.35),
                            fontSize:   9,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

         
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        color:         AppColors.white,
                        fontSize:      26,
                        fontWeight:    FontWeight.w700,
                        letterSpacing: -1,
                        height:        1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      maxLines:  1,
                      overflow:  TextOverflow.ellipsis,
                      style: TextStyle(
                        color:      AppColors.white.withValues(alpha: 0.38),
                        fontSize:   12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (delta != null) ...[
                      const SizedBox(height: 8),
                      DeltaRow(delta: delta!, color: accentColor),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
