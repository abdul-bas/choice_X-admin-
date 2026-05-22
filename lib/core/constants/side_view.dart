

import 'package:choice_x_admin/screen/dashboard/dashboard.dart';
import 'package:choice_x_admin/screen/orders/order_screen.dart';
import 'package:choice_x_admin/screen/brand/read_brand/read_brand.dart';
import 'package:choice_x_admin/screen/user/user_mgt/user_mgt.dart';

import 'package:choice_x_admin/screen/categories/read_category/categories.dart';
import 'package:choice_x_admin/screen/coupon/read/coupon.dart';
import 'package:choice_x_admin/screen/seller/seller_mgt/seller_mgt.dart';
import 'package:flutter/material.dart';


final List<Map<String, dynamic>> sidebarNavLinks = [
  {
    'type': 'navigation_item',
    'text': 'Dashboard',
    'icon': Icons.dashboard_outlined,
    'is_active': false,
     'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  DashboardScreen(isDesk: isDesktop,isMobile: isMobile,isTab: isTab,)
  },
  {
    'type': 'navigation_item',
    'text': 'User Management',
    'icon': Icons.people_outline,
    'is_active': false,
     'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  UserMgtScreen(isDeskTop: isDesktop,isMobile: isMobile,isTab: isTab,)
  },
  {
    'type': 'navigation_item',
    'text': 'Seller Management',
    'icon': Icons.store_mall_directory_outlined,
    'is_active': false,
    'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  SellerMgtScreen(isDeskTop: isDesktop,isMobile: isMobile,isTab: isTab,)
  },
  {
    'type': 'navigation_item',
    'text': 'Orders',
    'icon': Icons.shopping_bag_outlined,
    'is_active': false,
    'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  OrderScreen(isDeskTop: isDesktop,isMobile: isMobile,isTab: isTab,)
  },
  {
    'type': 'navigation_item',
    'text': 'Categories',
    'icon': Icons.widgets_outlined,
    'is_active': false, 
    'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  CategoriesScreen(isDeskTop: isDesktop,isMobile: isMobile,isTab: isTab,)
  },
  {
    'type': 'navigation_item',
    'text': 'brand',
    'navigation':(bool isDesktop,bool isMobile,bool isTab) => BrandScreen(isMobile: isMobile,isDeskTop: isDesktop,isTab: isTab,),
    'icon': Icons.credit_card_outlined, 
    'is_active': true, 
  },
  
  {
    'type': 'navigation_item',
    'text': 'Coupon',
    'navigation':(bool isDesktop,bool isMobile,bool isTab) =>  CouponScreen(),
    'icon': Icons.local_activity_outlined,
    'is_active': false,
  },
  
  
];