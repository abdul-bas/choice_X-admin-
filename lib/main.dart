import 'package:choice_x_admin/screen/welcome_screen/welcome_screen.dart';
import 'package:choice_x_admin/state/provider/admin_access_ui_provider.dart';
import 'package:choice_x_admin/state/provider/admin_auth_provider.dart';
import 'package:choice_x_admin/state/provider/arc_progress_provider.dart';
import 'package:choice_x_admin/state/provider/brand_provider.dart';
import 'package:choice_x_admin/state/provider/category_provider.dart';
import 'package:choice_x_admin/state/provider/coupon_filter_provider.dart';
import 'package:choice_x_admin/state/provider/dash_board_chart_filter.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_status_provider.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:choice_x_admin/firebase_options.dart';
import 'package:choice_x_admin/state/provider/dashbord_seller.dart';
import 'package:choice_x_admin/state/provider/dashbord_sideview.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/state/db/coupon/coupon.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_mgt.dart';
import 'package:choice_x_admin/state/provider/coupon_form_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashbordSideview(),
        ),
        ChangeNotifierProvider(
          create: (_) => SellerMgt(),
        ),
        ChangeNotifierProvider(
          create: (_) => BrandCrud(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashbordSeller(),
        ),
        ChangeNotifierProvider(
          create: (_) => CouponFormProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BrandProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryCrud(),
        ),
        ChangeNotifierProvider(
          create: (_) => CouponCrud(),
        ),
        ChangeNotifierProvider(
          create: (_) => CouponFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SellerMgtProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ArcProgressProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdminAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdminAccessUiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserMgtProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderStatusProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DashboardChartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        home: WelcomeScreen(),
      ),
    );
  }
}
