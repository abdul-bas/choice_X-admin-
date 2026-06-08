import 'dart:convert';
import 'dart:typed_data';
import 'package:choice_x_admin/state/db/brand_crud/brand_crud.dart';
import 'package:choice_x_admin/model/brand_model/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier {
  final BrandCrud _crud = BrandCrud();

  List<BrandModel> _allBrands = [];
  List<BrandModel> _filteredBrands = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? image;

  bool _searchOpen = false;
  bool isLoading = false;

  bool get searchOpen => _searchOpen;
  List<BrandModel> get filtered => _filteredBrands;
  List<BrandModel> get brands => _allBrands;

  void setBrands({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (!snapshot.hasData) return;

    _allBrands = snapshot.data!.docs
        .map((doc) => BrandModel.fromDoc(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ))
        .toList();

    _filteredBrands = List.from(_allBrands);

    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) clearSearch();

    notifyListeners();
  }

  void clearSearch() {
    searchCtrl.clear();
    _filteredBrands = List.from(_allBrands);
    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredBrands = List.from(_allBrands);
    } else {
      _filteredBrands = _allBrands.where((c) {
        return c.name.toLowerCase().contains(q) ||
            c.id.toLowerCase().contains(q);
      }).toList();
    }

    notifyListeners();
  }

  Future<bool> createBrand() async {
    final form = formKey.currentState;

    if (form == null || !form.validate()) return false;
    if (image == null || image!.isEmpty) return false;

    try {
      isLoading = true;
      notifyListeners();

      final newBrand = await _crud.addBrand(
        nameController.text.trim(),
        image!,
      );

      if (newBrand != null) {
        _allBrands.add(newBrand);
        _filteredBrands.add(newBrand);
      }

      nameController.clear();
      image = null;

      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateBrand(String id, int index) async {
    final form = formKey.currentState;

    if (form == null || !form.validate()) return false;
    if (image == null || image!.isEmpty) return false;

    try {
      isLoading = true;
      notifyListeners();

      await _crud.updateBrand(
        id: id,
        name: nameController.text.trim(),
        image: image!,
      );

      final updated = BrandModel(
        id: id,
        name: nameController.text.trim(),
        image: image!,
      );

      _allBrands[index] = updated;
      _filteredBrands[index] = updated;

      nameController.clear();
      image = null;

      return true;
    } catch (e) {
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void populate(BrandModel brand) {
    nameController.text = brand.name;
    image = brand.image;
    notifyListeners();
  }

  Future<void> fileUpload() async {
    final result = await FilePicker.platform.pickFiles(withData: true);

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      if (file.bytes != null) {
        image = base64Encode(file.bytes!);
        notifyListeners();
      }
    }
  }

  void editImage(String value) {
    image = value;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    searchCtrl.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  Uint8List? get imageBytes => image != null ? base64Decode(image!) : null;

  void reset() {
    nameController.clear();
    image = null;
    notifyListeners();
  }

  bool validateForm() => formKey.currentState?.validate() ?? false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
