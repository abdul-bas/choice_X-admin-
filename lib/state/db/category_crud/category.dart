
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
    final categoryId = name.toLowerCase().trim();

    final doc = FirebaseFirestore.instance
        .collection('category')
        .doc(categoryId);

  
    final existingDoc = await doc.get();

    if (existingDoc.exists) {
      message = 'Category already exists!';
      icon = Icons.warning;
      color = Colors.orange;
      notifyListeners();
      return null;
    }

    await doc.set({
      'name': name,
      'image': url,
      'createdAt': FieldValue.serverTimestamp(),
    });

    message = 'Category added successfully!';
    icon = Icons.check_circle;
    color = Colors.green;

    notifyListeners();

    return CategoryModel(
      name: name,
      image: url,
      id: categoryId,
    );

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
Future<void> updateCategory({
  required String id,
  required String image,
  required String name,
}) async {
  try {
    final newName = name.trim();

    final duplicate = await firebaseFirestore
        .collection('category')
        .where('name', isEqualTo: newName)
        .get();

    if (duplicate.docs.isNotEmpty &&
        duplicate.docs.first.id != id) {
      message = 'Category name already exists!';
      icon = Icons.warning;
      color = Colors.orange;
      notifyListeners();
      return;
    }

    await firebaseFirestore
        .collection('category')
        .doc(id)
        .set({
          'name': newName,
          'image': image,
        }, SetOptions(merge: true));

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
