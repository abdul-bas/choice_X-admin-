import 'package:choice_x_admin/model/order_model/order_model.dart';
import 'package:choice_x_admin/state/db/orders/orders_oprations.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetailsProvider extends ChangeNotifier {
  List<OrderModel> _allOrders = [];
  List<OrderModel> _filteredOrders = [];
  bool initialized = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? image;
  int _totalOrder = 0;
  int _totalRevenue = 0;
  int _activeUsers = 0;
  int _inActiveUsers = 0;
  int _placed = 0;
  int _allTotalOrders = 0;
  int _confirmed = 0;
  int _processing = 0;
  int _outForDelivery = 0;
  int _delivered = 0;
  int _cancelled = 0;
  bool _searchOpen = false;
  bool isLoading = false;
  int _todayRevenue = 0, _weeklyRevenue = 0;
  int _todayOrders = 0, _weeklyOrders = 0;

  int get todayRevenue => _todayRevenue;
  int get weeklyRevenue => _weeklyRevenue;
  int get todayOrders => _todayOrders;
  int get weeklyOrders => _weeklyOrders;

  int _todayPlaced = 0, _weekPlaced = 0;
  int _todayConfirmed = 0, _weekConfirmed = 0;
  int _todayProcessing = 0, _weekProcessing = 0;
  int _todayOutForDelivery = 0, _weekOutForDelivery = 0;
  int _todayDelivered = 0, _weekDelivered = 0;
  int _todayCancelled = 0, _weekCancelled = 0;

  int get todayPlaced => _todayPlaced;
  int get weekPlaced => _weekPlaced;
  int get todayConfirmed => _todayConfirmed;
  int get weekConfirmed => _weekConfirmed;
  int get todayProcessing => _todayProcessing;
  int get weekProcessing => _weekProcessing;
  int get todayOutForDelivery => _todayOutForDelivery;
  int get weekOutForDelivery => _weekOutForDelivery;
  int get todayDelivered => _todayDelivered;
  int get weekDelivered => _weekDelivered;
  int get todayCancelled => _todayCancelled;
  int get weekCancelled => _weekCancelled;
  get totalOrder => _totalOrder;
  get totalRevenue => _totalRevenue;
  get activeUsers => _activeUsers;
  int get placed => _placed;
  int get confirmed => _confirmed;
  int get processing => _processing;
  int get outForDelivery => _outForDelivery;
  int get delivered => _delivered;
  int get cancelled => _cancelled;
  bool get searchOpen => _searchOpen;
  int get allTotalOrders {
    print(
        '..........................$_allTotalOrders..................................');
    return _allTotalOrders;
  }

  int get inActiveUsers => _inActiveUsers;
  List<OrderModel> get filtered => _filteredOrders;
  List<OrderModel> get orders => _allOrders;

  void setOrders({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (!snapshot.hasData) return;

    _allOrders = snapshot.data!.docs
        .map((doc) => OrderModel.fromMap(
              doc.data() as Map<String, dynamic>,
            ))
        .toList();

    _filteredOrders = List.from(_allOrders);

    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) clearSearch();

    notifyListeners();
  }

  void clearSearch() {
    searchCtrl.clear();
    _filteredOrders = List.from(_allOrders);
    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredOrders = List.from(_allOrders);
    } else {
      _filteredOrders = _allOrders.where((order) {
        return order.orderId.toLowerCase().contains(q) ||
            order.amount.toString().contains(q) ||
            order.date.toString().toLowerCase().contains(q) ||
            order.itemStatus.toLowerCase().contains(q) ||
            order.paymentStatus.toLowerCase().contains(q) ||
            order.paymentMethod.toLowerCase().contains(q) ||
            (order.paymentAddress.toLowerCase().contains(q)) ||
            order.quantity.toString().contains(q);
      }).toList();
    }

    notifyListeners();
  }

  setInitialization() {
    initialized = true;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  num filteredRevenue(String filter) {
    switch (filter) {
      case 'Today':
        return _todayRevenue;
      case 'This Week':
        return _weeklyRevenue;
      default:
        return _totalRevenue;
    }
  }

  num filteredOrderCount(String filter) {
    switch (filter) {
      case 'Today':
        return _todayOrders;
      case 'This Week':
        return _weeklyOrders;
      default:
        return _totalOrder;
    }
  }

  Map<String, double> statusCounts(String filter) {
    switch (filter) {
      case 'Today':
        return {
          'placed': _todayPlaced.toDouble(),
          'confirmed': _todayConfirmed.toDouble(),
          'processing': _todayProcessing.toDouble(),
          'outForDelivery': _todayOutForDelivery.toDouble(),
          'delivered': _todayDelivered.toDouble(),
          'cancelled': _todayCancelled.toDouble(),
        };
      case 'This Week':
        return {
          'placed': _weekPlaced.toDouble(),
          'confirmed': _weekConfirmed.toDouble(),
          'processing': _weekProcessing.toDouble(),
          'outForDelivery': _weekOutForDelivery.toDouble(),
          'delivered': _weekDelivered.toDouble(),
          'cancelled': _weekCancelled.toDouble(),
        };
      default:
        return {
          'placed': _placed.toDouble(),
          'confirmed': _confirmed.toDouble(),
          'processing': _processing.toDouble(),
          'outForDelivery': _outForDelivery.toDouble(),
          'delivered': _delivered.toDouble(),
          'cancelled': _cancelled.toDouble(),
        };
    }
  }

  Future<void> fetchTotalOrder() async {
    isLoading = true;
    notifyListeners();

    try {
      final now = DateTime.now();

      final startOfToday = DateTime(
        now.year,
        now.month,
        now.day,
      );

      final startOfWeek = startOfToday.subtract(
        Duration(days: now.weekday - 1),
      );

      final data = await OrdersOprations().firestore.collection('orders').get();

      _allOrders = data.docs.map((e) => OrderModel.fromMap(e.data())).toList();

      _totalOrder = 0;
      _totalRevenue = 0;

      _todayOrders = 0;
      _weeklyOrders = 0;

      _todayRevenue = 0;
      _weeklyRevenue = 0;

      _placed = 0;
      _confirmed = 0;
      _processing = 0;
      _outForDelivery = 0;
      _delivered = 0;
      _cancelled = 0;

      _todayPlaced = 0;
      _weekPlaced = 0;

      _todayConfirmed = 0;
      _weekConfirmed = 0;

      _todayProcessing = 0;
      _weekProcessing = 0;

      _todayOutForDelivery = 0;
      _weekOutForDelivery = 0;

      _todayDelivered = 0;
      _weekDelivered = 0;

      _todayCancelled = 0;
      _weekCancelled = 0;

      Set<String> activeUsers = {};

      for (final order in _allOrders) {
        final orderDate = order.date;

        final orderAmount = (order.amount * order.quantity).toInt();

        final isToday = !orderDate.isBefore(startOfToday);

        final isThisWeek = !orderDate.isBefore(startOfWeek);

        _totalOrder++;
        _totalRevenue += orderAmount;

        activeUsers.add(order.userId);

        if (isToday) {
          _todayOrders++;
          _todayRevenue += orderAmount;
        }

        if (isThisWeek) {
          _weeklyOrders++;
          _weeklyRevenue += orderAmount;
        }

        switch (order.itemStatus.toLowerCase().trim()) {
          case 'pending':
          case 'order placed':
            _placed++;

            if (isToday) {
              _todayPlaced++;
            }

            if (isThisWeek) {
              _weekPlaced++;
            }

            break;

          case 'order confirmed':
            _confirmed++;

            if (isToday) {
              _todayConfirmed++;
            }

            if (isThisWeek) {
              _weekConfirmed++;
            }

            break;

          case 'processing':
            _processing++;

            if (isToday) {
              _todayProcessing++;
            }

            if (isThisWeek) {
              _weekProcessing++;
            }

            break;

          case 'out for delivery':
            _outForDelivery++;

            if (isToday) {
              _todayOutForDelivery++;
            }

            if (isThisWeek) {
              _weekOutForDelivery++;
            }

            break;

          case 'delivered':
            _delivered++;

            if (isToday) {
              _todayDelivered++;
            }

            if (isThisWeek) {
              _weekDelivered++;
            }

            break;
        }

        if (order.cancellationReason != null) {
          _cancelled++;

          if (isToday) {
            _todayCancelled++;
          }

          if (isThisWeek) {
            _weekCancelled++;
          }
        }
      }

      _activeUsers = activeUsers.length;
    } catch (e) {
      debugPrint(
        "Fetch orders error : $e",
      );
    } finally {
      _allTotalOrders = _allOrders.length;
      isLoading = false;
      notifyListeners();
    }
  }
}
