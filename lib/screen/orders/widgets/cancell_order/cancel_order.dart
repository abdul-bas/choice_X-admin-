
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/screen/orders/controller/order_controller.dart';

import 'package:flutter/material.dart';

class CancelledOrderCard extends StatelessWidget {
  const CancelledOrderCard({super.key, 
    required this.order,
    required this.logic,
    required this.isTab,
    required this.margin,
    required this.child,
  });

  final OrderModel order;
  final OrdersLogic logic;
  final bool isTab;
  final double margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    
    final info = logic.parseCancellationReason(order);

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: margin),
          decoration: BoxDecoration(
            color: AppColors.sellerSurfaceInput,    
            border: Border.all(
              color: AppColors.dangerDark.withValues(alpha: 0.30), 
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
              
                Opacity(opacity: 0.40, child: child),

                
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.dangerSubtle,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: AppColors.dangerDark.withValues(alpha: 0.45),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: AppColors.danger,
                          size: 15,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Cancellation Reason',
                                style: TextStyle(
                                  color: AppColors.danger,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                info.line1,
                                style: const TextStyle(
                                  color: AppColors.sellerWhite70,
                                  fontSize: 13,
                                ),
                              ),
                              if (info.line2.isNotEmpty)
                                Text(
                                  info.line2,
                                  style: const TextStyle(
                                    color: AppColors.sellerWhite70,
                                    fontSize: 13,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

           
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.dangerSubtle,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.dangerDark.withValues(alpha: 0.45),
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: AppColors.dangerDark,
                          size: 13,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'CANCELLED',
                          style: TextStyle(
                            color: AppColors.dangerDark,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}