 import 'dart:async';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CouponDeleteActions extends StatelessWidget {
  const CouponDeleteActions({super.key, 
    required this.isLoading,
    required this.onDelete,
  });

  final ValueNotifier<bool>       isLoading;
  final FutureOr<void> Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (context, loading, _) {
        return Row(
          children: [
            // Cancel
            Expanded(
              child: GestureDetector(
                onTap: loading ? null : () => Navigator.of(context).pop(),
                child: Container(
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:        AppColors.sellerBg,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.sellerBorder,
                      width: 0.5,
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color:      AppColors.white.withValues(alpha: 0.55),
                      fontSize:   13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: loading
                    ? null
                    : () async {
                        isLoading.value = true;
                        await Future.microtask(onDelete);
                        if (context.mounted) Navigator.of(context).pop();
                      },
                child: AnimatedContainer(
                  duration:  const Duration(milliseconds: 150),
                  height:    42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: loading
                        ? AppColors.danger.withValues(alpha: 0.06)
                        : AppColors.danger.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.danger.withValues(alpha: 0.35),
                      width: 0.5,
                    ),
                  ),
                  child: loading
                      ? SizedBox(
                          width:  16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color:       AppColors.danger,
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.delete_outline_rounded,
                              color: AppColors.danger,
                              size:  15,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Delete coupon',
                              style: TextStyle(
                                color:      AppColors.danger,
                                fontSize:   13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}