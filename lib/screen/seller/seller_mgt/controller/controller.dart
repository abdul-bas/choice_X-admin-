import 'dart:ui';

import 'package:choice_x_admin/core/constants/app_colors.dart';

class SellerController {
  static Color statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return AppColors.activeSellers;
      case 'reject':
        return AppColors.suspended;
      default:
        return AppColors.rejectBg;
    }
  }
}
