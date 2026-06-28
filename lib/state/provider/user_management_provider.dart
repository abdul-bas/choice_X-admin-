import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/state/db/seller_mgt/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class UserMgtProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<UserModel> _allUsers = [];
  List<UserModel> _filtered = [];
  final FocusNode searchFocus = FocusNode();

  int _totalUser = 0;
  int _last7DaysUsers = 0;

  int _todayUsers = 0;
  int _weekUsers = 0;
  int _monthUsers = 0;

  bool _searchOpen = false;
  bool isLoading = false;

  List<UserModel> get users => _filtered;
  bool get searchOpen => _searchOpen;
  int get last7DaysUsers => _last7DaysUsers;
  int get todayUsers => _todayUsers;
  int get weekUsers => _weekUsers;
  int get monthUsers => _monthUsers;
  int get total => _allUsers.length;
  int get totalUser => _totalUser;

  void setUsers(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    _allUsers =
        snapshot.data!.docs.map((d) => UserModel.fromMap(d.data())).toList();
    _filtered = List.from(_allUsers);
    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.trim().toLowerCase();
    _filtered = q.isEmpty
        ? List.from(_allUsers)
        : _allUsers
            .where((u) =>
                u.name.toLowerCase().contains(q) ||
                u.email.toLowerCase().contains(q) ||
                (u.uid ?? '').toLowerCase().contains(q))
            .toList();
    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) clearSearch();

    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    _filtered = List.from(_allUsers);
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  Future<void> fetchUserStats() async {
    isLoading = true;
    notifyListeners();

    try {
      if (_allUsers.isEmpty) {
        final data = await UserManagement()
            .firebaseFirestore
            .collection('user')
            .get();

        _allUsers = data.docs.map((e) => UserModel.fromMap(e.data())).toList();
      }

      final now = DateTime.now();

      final startOfToday = DateTime(now.year, now.month, now.day);

      final startOfWeek = startOfToday.subtract(
        Duration(days: now.weekday - 1),
      );

      final startOfMonth = DateTime(now.year, now.month, 1);

      final sevenDaysAgo = now.subtract(const Duration(days: 7));

      _totalUser = _allUsers.length;

      _last7DaysUsers = 0;
      _todayUsers = 0;
      _weekUsers = 0;
      _monthUsers = 0;

      for (final user in _allUsers) {
        final createdAt = user.createdAt;

        if (createdAt.isAfter(sevenDaysAgo)) {
          _last7DaysUsers++;
        }

        if (!createdAt.isBefore(startOfToday)) {
          _todayUsers++;
        }

        if (!createdAt.isBefore(startOfWeek)) {
          _weekUsers++;
        }

        if (!createdAt.isBefore(startOfMonth)) {
          _monthUsers++;
        }
      }
    } catch (e) {
      debugPrint('User stats error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  num filteredUserCount(String filter) {
    switch (filter) {
      case 'Today':
        return _todayUsers;

      case 'This Week':
        return _weekUsers;

      case 'This Month':
        return _monthUsers;

      case 'Last 7 Days':
        return _last7DaysUsers;

      default:
        return _totalUser;
    }
  }
}