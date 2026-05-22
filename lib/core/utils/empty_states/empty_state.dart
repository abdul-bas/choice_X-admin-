import 'package:choice_x_admin/screen/common/app_widgets/app_empty_state.dart';
import 'package:flutter/material.dart';

class EmptyStates {
  static Widget brands({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.diamond_outlined,
        title: 'No brands yet',
        subtitle:
            'You haven\'t added any brands. Start by adding your first brand to get going.',
        accentColor: const Color(0xFFD4537E),
        actionLabel: onAdd != null ? 'Add first brand' : null,
        onAction: onAdd,
      );

  static Widget coupons({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.local_offer_outlined,
        title: 'No coupons yet',
        subtitle:
            'Create your first discount coupon to start offering deals to customers.',
        accentColor: const Color(0xFF1D9E75),
        actionLabel: onAdd != null ? 'Add first coupon' : null,
        onAction: onAdd,
      );

  static Widget sellers({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.storefront_outlined,
        title: 'No sellers yet',
        subtitle:
            'No sellers have been added. Invite your first seller to get the marketplace started.',
        accentColor: const Color(0xFF7F77DD),
        actionLabel: onAdd != null ? 'Add first seller' : null,
        onAction: onAdd,
      );

  static Widget products({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.inventory_2_outlined,
        title: 'No products yet',
        subtitle:
            'Your catalogue is empty. Add your first product to start selling.',
        accentColor: const Color(0xFFEF9F27),
        actionLabel: onAdd != null ? 'Add first product' : null,
        onAction: onAdd,
      );

  
  static Widget categories({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.category_outlined,
        title: 'No categories yet',
        subtitle:
            'Organize your products by creating categories to make browsing easier.',
        accentColor: const Color(0xFF4CAF50),
        actionLabel: onAdd != null ? 'Add first category' : null,
        onAction: onAdd,
      );

  
  static Widget users({VoidCallback? onAdd}) => EmptyState(
        icon: Icons.people_outline,
        title: 'No users yet',
        subtitle:
            'No users found. Once users sign up, they will appear here.',
        accentColor: const Color(0xFF2196F3),
        actionLabel: onAdd != null ? 'Add user' : null,
        onAction: onAdd,
      );

  static Widget orders() => const EmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'No orders yet',
        subtitle:
            'Orders placed by customers will appear here once they start purchasing.',
        accentColor: Color(0xFF378ADD),
      );

 static Widget search(String? query) => EmptyState(
  icon: Icons.search_off_rounded,
  title: query != null && query.trim().isNotEmpty
      ? 'No results for "$query"'
      : 'No results found',
  subtitle: 'Try adjusting your search or check for typos.',
  accentColor: const Color(0xFF888780),
);
}