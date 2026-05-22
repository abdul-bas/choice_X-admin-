import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/state/db/coupon/coupon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponFilterProvider extends ChangeNotifier {
  List<CouponModel> _allCoupons = [];
  List<CouponModel> _filteredCoupons = [];

  bool _searchOpen = false;
  bool _initialized = false;

  bool get searchOpen => _searchOpen;
  List<CouponModel> get coupons => _filteredCoupons;

  final TextEditingController searchCtrl = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  void setCoupons({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (_initialized || !snapshot.hasData) return;

    _allCoupons = snapshot.data!.docs
        .map(
          (doc) => CouponModel.fromMap(
            doc.data() as Map<String, dynamic>,
          ),
        )
        .toList();

    _filteredCoupons = List.from(_allCoupons);
    _initialized = true;

    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredCoupons = List.from(_allCoupons);
    } else {
      _filteredCoupons = _allCoupons.where((c) {
        return c.title.toLowerCase().contains(q) ||
            c.code.toLowerCase().contains(q) ||
            c.applyType.toLowerCase().contains(q) ||
            c.discountPercent.toString().contains(q) ||
            c.maxDiscount.toString().contains(q) ||
            c.createdAt.toString().toLowerCase().contains(q) ||
            c.brands.any((b) => b.toLowerCase().contains(q)) ||
            c.categories.any((cat) => cat.toLowerCase().contains(q));
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
    _filteredCoupons = List.from(_allCoupons);
    notifyListeners();
  }

  deleteCoupon(int index, String id, BuildContext context) {
    _allCoupons.removeAt(index);
    coupons.removeAt(index);
    context.read<CouponCrud>().deleteCoupon(id);
    notifyListeners();
  }

  updateCoupon(int index, CouponModel newCoupon) {
    _allCoupons[index] = newCoupon;
    coupons[index] = newCoupon;
    notifyListeners();
  }

  createCoupon(CouponModel newCoupon) {
    _allCoupons.add(newCoupon);
    coupons.add(newCoupon);
    notifyListeners();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }
}
