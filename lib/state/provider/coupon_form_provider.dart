import 'package:choice_x_admin/state/provider/coupon_filter_provider.dart';
import 'package:choice_x_admin/model/coupon_model/coupon_model.dart';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/state/db/coupon/coupon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponFormProvider extends ChangeNotifier {
  final TextEditingController couponTitleController = TextEditingController();
  final TextEditingController couponCodeController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController maxDiscountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  CategoryCrud categoryCrud = CategoryCrud();
  BrandCrud brandCrud = BrandCrud();
  String applyType = 'all';
  List<String> selectedCategories = [];
  List<String> selectedBrands = [];

  List<String> availableCategories = [];
  List<String> availableBrands = [];

  _setAvailableCategories() async {
    if (availableCategories.isEmpty) {
      final QuerySnapshot<Map<String, dynamic>> categories =
          await categoryCrud.getCategory();

      availableCategories =
          categories.docs.map((doc) => doc.data()['name'].toString()).toList();
    }
  }

  _setAvailableBrands() async {
    if (availableBrands.isEmpty) {
      final QuerySnapshot<Map<String, dynamic>> brands =
          await brandCrud.getBrands();

      availableBrands =
          brands.docs.map((doc) => doc.data()['name'].toString()).toList();
    }
  }

  void setApplyType(String type) async {
    applyType = type;

    if (type == 'category') {
      await _setAvailableCategories();
    }

    if (type == 'brand') {
      await _setAvailableBrands();
    }

    notifyListeners();
  }

  void toggleCategory(String item) {
    selectedCategories = selectedCategories.contains(item)
        ? selectedCategories.where((e) => e != item).toList()
        : [...selectedCategories, item];
    notifyListeners();
  }

  void toggleBrand(String item) {
    selectedBrands = selectedBrands.contains(item)
        ? selectedBrands.where((e) => e != item).toList()
        : [...selectedBrands, item];
    notifyListeners();
  }

  void reset() {
    applyType = 'all';
    selectedCategories = [];
    selectedBrands = [];
    notifyListeners();
  }

  void populate(CouponModel coupon)async {
    couponTitleController.text = coupon.title;
    couponCodeController.text = coupon.code;
    discountController.text = coupon.discountPercent.toString();
    maxDiscountController.text = coupon.maxDiscount.toString();
    applyType = coupon.applyType;
    selectedCategories = List.from(coupon.categories);
    selectedBrands = List.from(coupon.brands);
     if (coupon.applyType == 'category') {
      await _setAvailableCategories();
    }

    if (coupon.applyType == 'brand') {
      await _setAvailableBrands();
    }
    notifyListeners();
  }

  Future<void> createCoupon(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final title = couponTitleController.text.trim();
    final code = couponCodeController.text.trim();
    final discount = double.tryParse(discountController.text.trim());
    final maxDiscount = double.tryParse(maxDiscountController.text.trim());

    if (discount == null || maxDiscount == null) return;

    isLoading = true;
    notifyListeners();

    final coupon = CouponModel(
      id: '',
      title: title,
      code: code,
      discountPercent: discount,
      maxDiscount: maxDiscount,
      applyType: applyType,
      categories: selectedCategories,
      brands: selectedBrands,
      isActive: true,
      createdAt: DateTime.now(),
    );

    await context.read<CouponCrud>().addCoupon(coupon);
    context.read<CouponFilterProvider>().createCoupon(coupon);
    isLoading = false;
    notifyListeners();

    reset();
    if (context.mounted) Navigator.of(context).pop();
  }

  Future<void> updateCoupon(BuildContext context, CouponModel existing,int index) async {
    if (!formKey.currentState!.validate()) return;

    final title = couponTitleController.text.trim();
    final code = couponCodeController.text.trim();
    final discount = double.tryParse(discountController.text.trim());
    final maxDiscount = double.tryParse(maxDiscountController.text.trim());
    if (discount == null || maxDiscount == null) return;

    isLoading = true;
    notifyListeners();

    final coupon = CouponModel(
      id: existing.id,
      title: title,
      code: code,
      discountPercent: discount,
      maxDiscount: maxDiscount,
      applyType: applyType,
      categories: selectedCategories,
      brands: selectedBrands,
      isActive: existing.isActive,
      createdAt: existing.createdAt,
    );

    await context.read<CouponCrud>().addCoupon(coupon);
    context.read<CouponFilterProvider>().updateCoupon(index, coupon);

    isLoading = false;
    notifyListeners();

    reset();
    if (context.mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    couponCodeController.dispose();
    couponTitleController.dispose();
    discountController.dispose();
    maxDiscountController.dispose();
    super.dispose();
  }
}
