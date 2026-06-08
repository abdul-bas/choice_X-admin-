import 'dart:convert';
import 'dart:typed_data';

import 'package:choice_x_admin/state/db/category_crud/category.dart';
import 'package:choice_x_admin/model/category_model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryCrud _crud = CategoryCrud();

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> _filteredCategories = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? image;

  bool _searchOpen = false;
  bool isLoading = false;

  bool get searchOpen => _searchOpen;
  List<CategoryModel> get filtered => _filteredCategories;
  List<CategoryModel> get categories => _allCategories;
  Uint8List? get imageBytes => image != null ? base64Decode(image!) : null;

  void setCategories({
    required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
  }) {
    if (!snapshot.hasData) return;

    _allCategories = snapshot.data!.docs
        .map((doc) => CategoryModel.fromDoc(
              doc.data() as Map<String, dynamic>,
              doc.id,
            ))
        .toList();

    _filteredCategories = List.from(_allCategories);

    notifyListeners();
  }

  void toggleSearch() {
    _searchOpen = !_searchOpen;

    if (!_searchOpen) clearSearch();

    notifyListeners();
  }

  void clearSearch() {
    searchCtrl.clear();
    _filteredCategories = List.from(_allCategories);
    notifyListeners();
  }

  void searchFilter(String query) {
    final q = query.toLowerCase().trim();

    if (q.isEmpty) {
      _filteredCategories = List.from(_allCategories);
    } else {
      _filteredCategories = _allCategories.where((c) {
        return c.name.toLowerCase().contains(q) ||
            c.id.toLowerCase().contains(q);
      }).toList();
    }

    notifyListeners();
  }

  Future<bool> createcategory() async {
    final form = formKey.currentState;

    if (form == null || !form.validate()) return false;
    if (image == null || image!.isEmpty) return false;

    try {
      isLoading = true;
      notifyListeners();

      final newcategory = await _crud.addCategory(
        nameController.text.trim(),
        image!,
      );

      if (newcategory != null) {
        _allCategories.add(newcategory);
        _filteredCategories.add(newcategory);
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

  Future<bool> updatecategory(String id, int index) async {
    final form = formKey.currentState;

    if (form == null || !form.validate()) return false;
    if (image == null || image!.isEmpty) return false;

    try {
      isLoading = true;
      notifyListeners();

      await _crud.updateCategory(
        id: id,
        name: nameController.text.trim(),
        image: image!,
      );

      final updated = CategoryModel(
        id: id,
        name: nameController.text.trim(),
        image: image!,
      );

      _allCategories[index] = updated;
      _filteredCategories[index] = updated;

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

  void populate(CategoryModel category) {
    nameController.text = category.name;
    image = category.image;
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

  Future<bool> createCategory() async {
    if (!_validateForm()) return false;
    if (nameController.text.isEmpty || image == null) return false;
    _setLoading(true);
    try {
      _crud.addCategory(nameController.text, image!);
      return true;
    } catch (_) {
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> updateCategory(String id, int index) async {
    if (!_validateForm()) return false;
    if (nameController.text.isEmpty || image == null) return false;
    _setLoading(true);
    try {
      _crud.updateCategory(id: id, image: image!, name: nameController.text);
      return true;
    } catch (_) {
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void reset() {
    nameController.clear();
    image = null;
    notifyListeners();
  }

  bool _validateForm() => formKey.currentState?.validate() ?? false;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  
}
