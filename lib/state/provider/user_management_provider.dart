import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:choice_x_admin/state/db/seller_mgt/user_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserMgtProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<UserModel> _allUsers = [];
  List<UserModel> _filtered = [];
  final FocusNode searchFocus = FocusNode();
  
  final int _todayActive = 0;
final int _todayInactive = 0;

final int _weekActive = 0;
final int _weekInactive = 0;

final int _activeUsers = 0;
final int _inactiveUsers = 0;
  int _totalUser = 0;
  int _last7DaysUsers = 0;
  List<UserModel> get users => _filtered;
  bool _searchOpen = false;
  bool isLoading = false;
  bool get searchOpen => _searchOpen;
  int get last7DaysUsers => _last7DaysUsers;
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

  int get total => _allUsers.length;
  int get totalUser => _totalUser;
  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  Future<void> fetchUserStats() async {
    if (_allUsers.isEmpty) {
      final data =
          await UserManagement().firebaseFirestore.collection('user').get();

      _allUsers = data.docs.map((e) => UserModel.fromMap(e.data())).toList();
    }
final now = DateTime.now();
final startOfToday = DateTime(now.year, now.month, now.day);
startOfToday.subtract(
  Duration(days: now.weekday - 1),
);

_totalUser = _allUsers.length;


  

  

_last7DaysUsers = _allUsers.where((e) {
 return e.createdAt.isAfter(
    now.subtract(const Duration(days: 1)),
  );
}).length;
   
    notifyListeners();
  }

  num filteredUserCount(String filter) {
    switch (filter) {
      case 'Today':      return _todayActive;
      case 'This Week':  return _weekActive;
      default:           return _activeUsers;
    }
  }

 Map<String, double> userStatusCounts(String filter) {
  switch (filter) {
    case 'Today':
      return {
        'active': _todayActive.toDouble(),
        'inactive': _todayInactive.toDouble(),
      };

    case 'This Week':
      return {
        'active': _weekActive.toDouble(),
        'inactive': _weekInactive.toDouble(),
      };

    default:
      return {
        'active': _activeUsers.toDouble(),
        'inactive': _inactiveUsers.toDouble(),
      };
  }
}
}
