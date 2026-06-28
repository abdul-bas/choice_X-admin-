
import 'package:choice_x_admin/model/brand_model/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BrandCrud extends ChangeNotifier {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? message;
  IconData? icon;
  Color? color;
Future<BrandModel?> addBrand(String name, String url) async {
  try {
    final brandId = name.toLowerCase().trim();

    final doc = FirebaseFirestore.instance
        .collection('brand')
        .doc(brandId);

    // Check duplicate
    final existing = await doc.get();

    if (existing.exists) {
      message = 'Brand already exists!';
      icon = Icons.warning;
      color = Colors.orange;
      notifyListeners();
      return null;
    }

    await doc.set({
      'name': name.trim(),
      'image': url,
      'createdAt': FieldValue.serverTimestamp(),
    });

    message = 'Brand added successfully!';
    icon = Icons.check_circle;
    color = Colors.green;

    notifyListeners();

    return BrandModel(
      name: name,
      image: url,
      id: brandId,
    );

  } catch (e) {
    message = 'Failed to add brand! $e';
    icon = Icons.error;
    color = Colors.red;
  }

  notifyListeners();
  return null;
}

  Stream<QuerySnapshot<Map<String, dynamic>>> readBrand() {
    return firebaseFirestore.collection('brand').snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getBrands() {
    return firebaseFirestore.collection('brand').get();
  }
Future<void> updateBrand({
  required String id,
  required String image,
  required String name,
}) async {
  try {
    final newName = name.trim();

    // Check duplicate brand name
    final duplicate = await firebaseFirestore
        .collection('brand')
        .where('name', isEqualTo: newName)
        .get();

    if (duplicate.docs.isNotEmpty &&
        duplicate.docs.first.id != id) {
      message = 'Brand name already exists!';
      icon = Icons.warning;
      color = Colors.orange;
      notifyListeners();
      return;
    }

    await firebaseFirestore
        .collection('brand')
        .doc(id)
        .update({
          'name': newName,
          'image': image,
        });

    message = 'Brand updated successfully!';
    icon = Icons.check_circle;
    color = Colors.green;

  } catch (e) {
    message = 'Failed to update brand: $e';
    icon = Icons.error;
    color = Colors.red;
  }

  notifyListeners();
}

  Future<void> deleteBrand({required String id}) async {
    try {
      await firebaseFirestore.collection('brand').doc(id).delete();

      message = 'Category deleted successfully!';
      icon = Icons.delete;
      color = Colors.orange;
    } catch (e) {
      message = 'Failed to delete category: $e';
      icon = Icons.error;
      color = Colors.red;
    }

    notifyListeners();
  }
}
