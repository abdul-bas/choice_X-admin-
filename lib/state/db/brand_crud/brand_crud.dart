
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
      final doc = FirebaseFirestore.instance.collection('brand');
      doc.add({
        'name': name,
        'image': url,
        'createdAt': FieldValue.serverTimestamp(),
      });

      message = 'Category added successfully!';
      icon = Icons.check_circle;
      color = Colors.green;
      return BrandModel(name: name, image: url, id: doc.id);
    } catch (e) {
      message = 'Failed to add category! $e';
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

  Future<void> updateBrand(
      {required String id, required String image, required String name}) async {
    try {
      await firebaseFirestore
          .collection('brand')
          .doc(id)
          .update({'name': name, 'image': image});
      message = 'Category updated successfully!';
      icon = Icons.check_circle;
      color = Colors.green;
    } catch (e) {
      message = 'Failed to update category: $e';
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
