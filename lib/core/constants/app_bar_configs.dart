import 'package:choice_x_admin/model/app_bar_config/app_bar_config.dart';
import 'package:flutter/material.dart';
class AppBarConfigs {
  static const coupons = AppBarConfig(
    title: 'Coupons',
    subtitle: 'Create and manage offers easily',
    icon: Icons.local_offer_outlined,
    accent: Colors.white,
    searchHint: 'Search coupons...',
    addLabel: '+ Add coupon',
  );

  static const sellers = AppBarConfig(
    title: 'Sellers',
    subtitle: 'Active sellers and pending approvals',
    icon: Icons.storefront_outlined,
    accent: Colors.white,
    searchHint: 'Search sellers...',
    addLabel: '+ Add seller',
  );

  static const brands = AppBarConfig(
    title: 'Brands',
    subtitle: 'Manage your brand collection',
    icon: Icons.diamond_outlined,
    accent: Colors.white,
    searchHint: 'Search brands...', 
    addLabel: '+ Add brand',
  );

  static const products = AppBarConfig(
    title: 'Products',
    subtitle: 'Track inventory and availability',
    icon: Icons.inventory_2_outlined,
    accent: Color(0xFFEF9F27),
    searchHint: 'Search products...',
    addLabel: '+ Add product',
  );

  static const orders = AppBarConfig(
    title: 'Orders',
    subtitle: 'Monitor and process customer orders',
    icon: Icons.receipt_long_outlined,
    accent: Color(0xFF378ADD),
    searchHint: null,
    addLabel: null,
  );

 
  static const categories = AppBarConfig(
    title: 'Categories',
    subtitle: 'Organize products into categories',
    icon: Icons.category_outlined,
    accent: Color(0xFF4CAF50),
    searchHint: 'Search categories...',
    addLabel: '+ Add category',
  );

  
  static const users = AppBarConfig(
    title: 'Users',
    subtitle: 'Manage all registered users',
    icon: Icons.people_outline,
    accent: Color(0xFF2196F3),
    searchHint: 'Search users...',
    addLabel: '+ Add user',
  );
}