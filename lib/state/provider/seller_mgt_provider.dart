import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/state/db/seller_mgt/seller_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerMgtProvider extends ChangeNotifier {
  List<SellerModel> _allSellers = [];
  List<SellerModel> _filteredSellers = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? image;
  int _totalSeller = 0;
  int _activeSeller = 0;
  int _inActiveSeller = 0;
  int _pendingSeller = 0;
  bool _searchOpen = false;
  bool isLoading = false;

  bool get searchOpen => _searchOpen;
  List<SellerModel> get filtered => _filteredSellers;
  List<SellerModel> get sellers => _allSellers;
  get totalSeller => _totalSeller;
  get activeSeller => _activeSeller;
   get inActiveSeller => _inActiveSeller;
    get pendingSeller => _pendingSeller;
  void setSellers({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (!snapshot.hasData) return;

    _allSellers = snapshot.data!.docs
        .map((doc) => SellerModel.fromMap(
              doc.data() as Map<String, dynamic>,
            ))
        .toList();

    _filteredSellers = List.from(_allSellers);

    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredSellers = List.from(_allSellers);
    } else {
      _filteredSellers = _allSellers.where((doc) {
        final name = doc.userName.toLowerCase();
        final phone = doc.phoneNumber.toString();
        final email = doc.email.toLowerCase();
        final status = doc.status.toLowerCase();
        return name.contains(query) ||
            phone.contains(query) ||
            email.contains(query) ||
            status.contains(query);
      }).toList();
    }

    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) clearSearch();

    notifyListeners();
  }

  void clearSearch() {
    searchCtrl.clear();
    _filteredSellers = List.from(_allSellers);
    notifyListeners();
  }

  Future<void> fetchTotalSeller() async {
    if (_allSellers.isEmpty) {
      final data =
          await SellerManagement().firebaseFirestore.collection('seller').get();

      _allSellers =
          data.docs.map((e) => SellerModel.fromMap(e.data())).toList();
    }

   
    _totalSeller = _allSellers.length;
    _inActiveSeller=_allSellers
        .where((seller) => seller.status.toLowerCase() == 'reject')
        .length;
        _pendingSeller=_allSellers
        .where((seller) => seller.status.toLowerCase() == 'pending')
        .length;
    _activeSeller = _allSellers
        .where((seller) => seller.status.toLowerCase() == 'approved')
        .length;

    notifyListeners();
  }
}
