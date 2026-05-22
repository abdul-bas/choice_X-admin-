import 'package:choice_x_admin/core/constants/app_bar_configs.dart';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/core/widgets/app_bar/app_bar.dart';
import 'package:choice_x_admin/screen/dashboard/controller/animations.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/desk_top.view/desk_top_view.dart';
import 'package:choice_x_admin/screen/dashboard/widgets/mobile_view/mobile_view.dart';
import 'package:choice_x_admin/state/provider/arc_progress_provider.dart';
import 'package:choice_x_admin/state/provider/dash_board_filter_provider.dart';
import 'package:choice_x_admin/state/provider/order_details_provider.dart';
import 'package:choice_x_admin/state/provider/order_status_provider.dart';
import 'package:choice_x_admin/state/provider/seller_mgt_provider.dart';
import 'package:choice_x_admin/state/provider/user_management_provider.dart';
import 'package:choice_x_admin/core/utils/helpers/get_chart_spot.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.isDesk,
    required this.isMobile,
    required this.isTab,
  });

  final bool isMobile;
  final bool isTab;
  final bool isDesk;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late final ArcProgressProvider _arcProvider;
  late final OrderStatusProvider _statusProvider;
  late final DashboardFilterProvider _filterProvider;

  List<FlSpot> _spots = [];

  bool _isLoadingChart = true;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();

    _arcProvider = ArcProgressProvider();
    _statusProvider = OrderStatusProvider();
    _filterProvider = DashboardFilterProvider();

    _filterProvider.addListener(_onFilterChanged);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeDashboard();
    });
  }

  Future<void> _initializeDashboard() async {
    final orderProvider = context.read<OrderDetailsProvider>();

    final userProvider = context.read<UserMgtProvider>();

    final sellerProvider = context.read<SellerMgtProvider>();

    try {
      await Future.wait([
        orderProvider.fetchTotalOrder(),
        sellerProvider.fetchTotalSeller(),
        userProvider.fetchUserStats(),
      ]);

      await Future.delayed(
        const Duration(milliseconds: 100),
      );

      if (!mounted) return;

      DashboardAnimations.triggerArcAnimations(
        arcProvider: _arcProvider,
        orderProvider: orderProvider,
        userProvider: userProvider,
        sellerProvider: sellerProvider,
        statFilter: _filterProvider.statFilter,
      );

      DashboardAnimations.triggerPieAnimation(
        statusProvider: _statusProvider,
        orderProvider: orderProvider,
        filter: _filterProvider.orderStatusFilter,
      );

      final data = await getChartSpots();

      if (!mounted) return;

      setState(() {
        _spots = data;
        _isLoadingChart = false;
        _initialized = true;
      });
    } catch (e) {
      debugPrint(
        'Dashboard initialization error: $e',
      );
    }
  }

  void _onFilterChanged() {
    if (!mounted || !_initialized) return;

    final orderProvider = context.read<OrderDetailsProvider>();

    final userProvider = context.read<UserMgtProvider>();

    final sellerProvider = context.read<SellerMgtProvider>();

    DashboardAnimations.triggerArcAnimations(
      arcProvider: _arcProvider,
      orderProvider: orderProvider,
      userProvider: userProvider,
      sellerProvider: sellerProvider,
      statFilter: _filterProvider.statFilter,
    );

    DashboardAnimations.triggerPieAnimation(
      statusProvider: _statusProvider,
      orderProvider: orderProvider,
      filter: _filterProvider.orderStatusFilter,
    );
  }

  @override
  void dispose() {
    _filterProvider.removeListener(
      _onFilterChanged,
    );

    _arcProvider.dispose();
    _statusProvider.dispose();
    _filterProvider.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: _arcProvider,
        ),
        ChangeNotifierProvider.value(
          value: _statusProvider,
        ),
        ChangeNotifierProvider.value(
          value: _filterProvider,
        ),
      ],
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UniversalAppBar(
              config: AppBarConfigs.sellers,
              searchOpen: false,
              isMobile: widget.isMobile,
            ),
            SizedBox(
              height: widget.isMobile ? 5 : 0,
            ),
            Expanded(
              child: TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 0,
                  end: 1,
                ),
                duration: const Duration(
                  milliseconds: 700,
                ),
                curve: Curves.easeOutCubic,
                builder: (
                  context,
                  value,
                  child,
                ) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(
                        0,
                        25 * (1 - value),
                      ),
                      child: child,
                    ),
                  );
                },
                child: RepaintBoundary(
                  child: Container(margin:widget. isMobile
                              ? null
                              : const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          padding:
                             widget. isMobile ? null : const EdgeInsets.all(15),
                          decoration:widget. isMobile
                              ? null
                              : BoxDecoration(
                                  color: AppColors.sellerSurface,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                    child: Container( padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.sellerSurfaceDeep,
                            borderRadius: BorderRadius.circular(16),
                          ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        child: widget.isDesk
                            ? DashboardDeskLayout(
                                isLoadingChart: _isLoadingChart,
                                spots: _spots,
                              )
                            : DashboardScrollLayout(
                                isMobile: widget.isMobile,
                                isDesk: widget.isDesk,
                                isLoadingChart: _isLoadingChart,
                                spots: _spots,
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
