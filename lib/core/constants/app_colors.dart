import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color brand = Color.fromARGB(206, 77, 21, 174);

  static const Color brandSubtle = Color.fromARGB(63, 77, 21, 174);

  static const Color brandGradient1 = Color.fromARGB(255, 61, 21, 131);
  static const Color brandGradient2 = Color.fromARGB(206, 87, 29, 187);
  static const Color brandGradient3 = Color.fromARGB(206, 45, 17, 93);
  static const Color brandGradient4 = Color.fromARGB(206, 33, 9, 74);

  static const List<Color> brandHeaderGradient = [
    brandGradient1,
    brandGradient2,
    brandGradient3,
    brandGradient4,
  ];

  static const Color profileGradientMid = Color.fromARGB(179, 72, 52, 223);

  static const List<Color> profileHeaderGradient = [
    brand,
    profileGradientMid,
    brand,
  ];

  static const Color brandLogoGradient1 = Color.fromARGB(255, 171, 124, 252);
  static const Color brandLogoGradient2 = Color.fromARGB(255, 92, 0, 250);

  static const List<Color> brandLogoGradient = [
    brandLogoGradient1,
    brandLogoGradient2,
  ];

  static const Color menuIconGradient1 = Color.fromARGB(147, 243, 232, 255);
  static const Color menuIconGradient2 = Color.fromARGB(147, 224, 207, 255);

  static const Color danger = Color(0xFFEF4444);
  static const Color dangerSubtle = Color(0x1AEF4444);
  static const Color dangerDark = Color(0xFFB91C1C);
  static const Color dangerLight = Color(0xFFFEF2F2);
  static const Color dangerText = Color(0xFFDC2626);
  static const Color dangerMid = Color(0xFFEF4444);
  static const Color dangerBorder = Color(0xFFFCA5A5);

  static const Color success = Color(0xFF16A34A);
  static const Color successSubtle = Color(0x1A16A34A);
  static const Color successLight = Color(0xFFF0FDF4);
  static const Color successBorder = Color(0xFFC6F6D5);
  static const Color successIcon = Color(0xFF16A34A);
  static const Color successText = Color(0xFF15803D);

  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color warningText = Color(0xFFB45309);
  static const Color warningIcon = Color(0xFFD97706);
  static const Color warningMid = Color(0xFFC2410C);

  static const Color info = Color(0xFF2196F3);
  static const Color notificationUnreadBg = Color(0xFFE3F2FD);

  static const Color promoSuccess = Color(0xFF22C55E);
  static const Color promoBorder = Color(0xFFE8E9EF);
  static const Color promoHint = Color(0xFFB0B3C1);
  static const Color promoInputText = Color(0xFF1F1F2E);
  static const Color promoDivider = Color(0xFFF1F2F6);
  static const Color promoSheetHandle = Color(0xFFDDDDE3);
  static const Color promoIconMuted = Color(0xFF8B8FA8);

  static const Color starAmber = Color(0xFFFFA800);
  static const Color ratingGradStart = Color(0xFFFFC107);
  static const Color ratingGradEnd = Color(0xFFFF8F00);
  static const Color ratingScoreBg = Color(0xFFFFFBF0);
  static const Color ratingScoreText = Color(0xFFE67E00);
  static const Color reviewAvatarBg = Color(0xFFBBDEFB);
  static const Color reviewAvatarText = Color(0xFF1565C0);
  static const Color reviewBorderLight = Color(0xFFE8E8E8);
  static const Color reviewFadeStart = Color(0x00FFFFFF);
  static const Color reviewFadeEnd = Color(0xF8FFFFFF);

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color black26 = Color(0x42000000);
  static const Color black38 = Color(0x61000000);
  static const Color black45 = Color(0x73000000);
  static const Color black54 = Color(0x8A000000);
  static const Color black87 = Color(0xDD000000);
  static const Color transparent = Colors.transparent;

  static const Color white38 = Color(0x61FFFFFF);
  static const Color white70 = Color(0xB3FFFFFF);

  static Color black20 = Colors.black.withValues(alpha: 0.20);
  static Color black40 = Colors.black.withValues(alpha: 0.40);

  static const Color splashIndicatorBg = Color.fromARGB(136, 0, 0, 0);
  static const Color splashIndicatorColor = Color.fromARGB(211, 255, 255, 255);

  static const Color textPrimary = Color(0xFF1C1917);
  static const Color textSecondary = Color(0xFF78716C);
  static const Color textMuted = Colors.grey;
  static const Color textHint = Color(0xFFADB5BD);
  static const Color textDark = Color(0xFF111111);
  static const Color textCaption = Color(0xFF999999);
  static const Color textSubdued = Color(0xFF888888);
  static const Color textDeep = Color(0xFF0F1320);
  static const Color textNearBlack = Color(0xFF1A1A1A);
  static const Color textCoolGrey = Color(0xFF9CA3AF);
  static const Color textNavy = Color(0xFF1A1A2E);

  static const Color specValueMuted = Color(0xFF8C8880);
  static const Color specDot = Color(0xFFF0EDE8);
  static const Color specDivider = Color(0x66808080);

  static const Color favBorderIdle = Color(0xFFE8DDD5);

  static const Color addressHeading = Color(0xFF1A1D2E);
  static const Color addressSubtext = Color(0xFF9EA3B8);
  static const Color addressBorder = Color(0xFFD1D5E0);
  static const Color addressCheckTick = Color(0xFF4F6FFF);
  static const Color addressSheetBg = Color(0xFFF8F9FF);

  static const Color chatBubbleReceiver = Color(0xFF1A1A1A);
  static const Color chatBubbleReceiverAlt = Color(0xFF1E1E1E);
  static const Color chatTextSender = Color(0xFF0A0A0A);
  static const Color chatTextReceiver = Color(0xFFF0F0F0);
  static const Color chatTextReceiverAlt = Color(0xFFF5F5F5);
  static const Color chatTimestamp = Color(0xFF444444);
  static const Color chatDeleteIcon = Color(0xAEF44336);
  static const Color chatPreviewBarBg = Color(0xFF1A1A1A);

  static const Color iconDark = Color(0xFF333333);
  static const Color iconDisabled = Color(0xFFE0E3EA);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  static const Color facebookBlue = Color(0xFF1877F2);
  static const Color googleIcon = Color(0xA1000000);
  static const Color divider = Color(0xFFE7E5E4);

  static const Color orderEmptyHeading = Color(0xFF0D0D0D);
  static const Color orderEmptySubtext = Color(0xFF9098A3);
  static const Color orderHistoryBadge = Color(0xFF6B7280);
  static const Color orderShopBtnBg = Color(0xFFF3F4F6);
  static const Color orderShopBtnBorder = Color(0xFFE4E7EC);
  static const Color orderShopBtnText = Color(0xFF374151);

  static const Color timelineInactive = Color(0xFFF0F0F0);
  static const Color timelineBorder = Color(0xFFDDDDDD);
  static const Color timelinePastLabel = Color(0xFF888888);
  static const Color timelineFutureLabel = Color(0xFFBBBBBB);

  static const Color sellerBg = Color(0xFF0A0A0F);
  static const Color sellerSurface = Color(0xFF13132A);
  static const Color sellerSurfaceInput = Color(0xFF1A1A1A);
  static const Color sellerSurfaceDeep = Color(0xFF070712);
  static const Color sellerBorder = Color(0xFF1E1E38);
  static const Color sellerAccent = Color(0xFF7C5CFC);
  static const Color sellerStepInactive = Color(0xFF222238);
  static const Color sellerSubtitle = Color(0xFF65658A);
  static const Color sellerBodyText = Color(0xFF9898B8);
  static const Color sellerHeading = Color(0xFFF2F2FC);
  static const Color sellerAccentGreen = Color(0xFF0FBA81);
  static const Color sellerPasswordIcon = Color(0xFF7C5CFC);
  static const Color sellerWhite10 = Color(0x1AFFFFFF);
  static const Color sellerWhite54 = Color(0x8AFFFFFF);
  static const Color sellerWhite60 = Color(0x99FFFFFF);
  static const Color sellerWhite70 = Color(0xB3FFFFFF);
  static const Color sellerBlack45 = Color(0x73000000);
  static const Color sellerGridLine = Color(0x03FFFFFF);
  static const Color sellerGridDot = Color(0x0AFFFFFF);

  static const Color sellerChatBg = Color(0xFF0D0D1A);
  static const Color sellerBubbleSender = Color(0xFF1E2A3A);
  static const Color sellerBubbleReceiver = Color(0xFF1A1A2E);
  static const Color sellerInputBg = Color(0xFF111128);
  static const Color sellerMicRecording = Color(0xFF7A0000);
  static const Color sellerMicIcon = Color(0xFFEF9A9A);
  static const Color sellerUnreadBadgeBg = Color(0xFF7C5CFC);

  static const Color doneBg = Color(0x120FBA81);
  static const Color activeBg = Color(0x147C5CFC);
  static const Color doneBorder = Color(0x730FBA81);
  static const Color activeBorderColor = Color(0xA6F2F2FC);
  static const Color doneText = Color(0xFF9898B8);

  static const Color dashSurface = Color(0xFF1A1A1A);

  static const Color chartAxisLabel = Color(0xFF68737D);
  static const Color chartAxisLabelAlt = Color(0xFF67727D);

  static const Color orderStatusPlaced = Color(0xFF2563EB);
  static const Color orderStatusConfirmed = Color(0xFF059669);
  static const Color orderStatusProcessing = Color(0xFFD97706);
  static const Color orderStatusDelivery = Color(0xFF7C3AED);
  static const Color orderStatusDelivered = Color(0xFF0D9488);
  static const Color orderStatusCancelled = Color(0xFFDC2626);

  static const Color surfaceWhite = Colors.white;
  static const Color surfaceLight = Color(0xFFF9F9F9);
  static const Color surfaceOffWhite = Color(0xFFF5F5F5);
  static const Color surfacePageGrey = Color(0xFFF5F6FA);
  static const Color surfaceSearch = Color(0xFFEEEFF4);
  static const Color surfaceDarkHeader = Color(0xFF1C1C1E);
  static const Color surfaceError = Color(0xFFFFF5F5);

  static const Color searchIconColor = Color(0xFFB0B8C4);
  static const Color searchClearBtnBg = Color(0xFFCDD1D8);

  static const Color borderLight = Color(0xFFD6D3D1);
  static const Color borderCategory = Color(0xFFEEEEEE);
  static const Color categoryImageBg = Color(0xFFE0E0E0);
  static const Color borderError = Color(0xFFFFE5E5);

  static const Color skeletonBase = Color(0xFFF2F2F7);
  static const Color skeletonLight = Color(0xFFF7F7FC);

  static Color onImageWhiteStrong = Colors.white.withOpacity(0.90);
  static Color onImageWhiteMid = Colors.white.withOpacity(0.60);
  static Color onImageWhiteFaint = Colors.white.withOpacity(0.50);
  static Color onImageDark = Colors.black.withOpacity(0.78);

  static Color overlayDark = Colors.black.withOpacity(0.30);
  static Color overlayBarrier = Colors.black.withValues(alpha: 0.40);
  static Color overlayLoading = Colors.black.withValues(alpha: 0.35);

  static Color shadowFaint = Colors.black.withOpacity(0.04);
  static Color shadowFainter = Colors.black.withOpacity(0.02);
  static Color shadowDark = Colors.black.withOpacity(0.08);
  static Color shadowMedium = Colors.black.withOpacity(0.10);
  static Color shadowAvatar = Colors.black45.withOpacity(0.30);
  static Color shadowLogo = Colors.black.withValues(alpha: 0.22);
  static Color shadowDialog = Colors.black.withValues(alpha: 0.12);
  static Color shadowBrand = brand.withValues(alpha: 0.18);
  static const Color background = Color(0xFF0F0F0F);
  static const Color surface = Color(0xFF1A1A1A);
  static const Color card = Color(0xFF232323);

  static const Color primary = Color(0xFFFFFFFF);

  static const Color border = Color(0xFF2E2E2E);

  static const Color error = Color(0xFFF44336);

  static const Color totalSellers = Color(0xFF7F77DD);
  static const Color activeSellers = Color(0xFF1D9E75);
  static const Color pending = Color(0xFFEF9F27);
  static const Color suspended = Color(0xFFE24B4A);

  static const Color acceptFg = Color(0xFF1D9E75);
  static const Color acceptBg = Color(0x1A1D9E75);
  static const Color acceptBorder = Color(0x4D1D9E75);

  static const Color rejectFg = Color(0xFFE24B4A);
  static const Color rejectBg = Color(0x14E24B4A);
  static const Color rejectBorder = Color(0x40E24B4A);
}
