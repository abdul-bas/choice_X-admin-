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

  int get totalSeller => _totalSeller;

  int get activeSeller => _activeSeller;

  int get inActiveSeller => _inActiveSeller;

  int get pendingSeller => _pendingSeller;

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredSellers = List.from(_allSellers);
    } else {
      _filteredSellers = _allSellers.where((seller) {
        return seller.userName.toLowerCase().contains(q) ||
            seller.phoneNumber.toString().contains(q) ||
            seller.email.toLowerCase().contains(q) ||
            seller.status.toLowerCase().contains(q);
      }).toList();
    }

    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) {
      clearSearch();
    }

    notifyListeners();
  }

  void clearSearch() {
    searchCtrl.clear();

    _filteredSellers = List.from(_allSellers);

    notifyListeners();
  }

  Future<void> fetchTotalSeller() async {
    isLoading = true;

    notifyListeners();

    try {
      final data = await SellerManagement().getSeller();

      final sellers = data.docs
          .map(
            (e) => SellerModel.fromMap(e.data()),
          )
          .toList();

      _allSellers = sellers;

      _filteredSellers = List.from(sellers);

      _totalSeller = sellers.length;

      int approved = 0;
      int pending = 0;
      int rejected = 0;

      for (final seller in sellers) {
        switch (seller.status.toLowerCase().trim()) {
          case 'approved':
            approved++;
            break;

          case 'pending':
            pending++;
            break;

          case 'reject':
          case 'rejected':
            rejected++;
            break;
        }
      }

      _activeSeller = approved;

      _pendingSeller = pending;

      _inActiveSeller = rejected;
    } catch (e) {
      debugPrint(
        "Seller fetch error : $e",
      );
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  num filteredSellerCount(String filter) {
    switch (filter) {
      case 'Active':
        return _activeSeller;

      case 'Pending':
        return _pendingSeller;

      case 'Inactive':
      case 'Rejected':
        return _inActiveSeller;

      default:
        return _totalSeller;
    }
  }

  @override
  void dispose() {
    nameController.dispose();

    searchCtrl.dispose();

    searchFocus.dispose();

    super.dispose();
  }

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
}