import 'dart:ui';

Color getSellerStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'approved':
      return const Color.fromARGB(169, 34, 197, 94);
    case 'reject':
      return const Color.fromARGB(154, 255, 68, 68);
    case 'pending':
    default:
      return const Color.fromARGB(162, 245, 165, 35);
  }
}
