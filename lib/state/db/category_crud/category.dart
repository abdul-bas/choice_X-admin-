
import 'package:choice_x_admin/model/category_model/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryCrud extends ChangeNotifier {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String? message;
  IconData? icon;
  Color? color;

  Future<CategoryModel?> addCategory(String name, String url) async {
    try {
      final doc = FirebaseFirestore.instance.collection('category');
      final id = doc.id;
      await doc.add({
        'name': name,
        'image': url,
        'createdAt': FieldValue.serverTimestamp(),
      });
      message = 'Category added successfully!';
      icon = Icons.check_circle;
      color = Colors.green;
      return CategoryModel(name: name, image: url, id: id);
    } catch (e) {
      message = 'Failed to add category! $e';
      icon = Icons.error;
      color = Colors.red;
    }

    notifyListeners();
    return null;
  }

  Stream<QuerySnapshot> readCategory() {
    return firebaseFirestore.collection('category').snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getCategory() async {
    return await firebaseFirestore.collection('category').get();
  }

  Future<void> updateCategory(
      {required String id, required String image, required String name}) async {
    try {
      await firebaseFirestore
          .collection('category')
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

  Future<void> deleteCategory({required String id}) async {
    try {
      await firebaseFirestore.collection('category').doc(id).delete();

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
