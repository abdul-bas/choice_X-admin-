import 'package:choice_x_admin/model/seller_model/seller_model.dart';
import 'package:choice_x_admin/model/user_model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersOprations {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
   Stream<QuerySnapshot<Map<String, dynamic>>> readOrders() {
    return firestore.collection('orders').snapshots();
  }

  Future<UserModel?> getUserData(String userId) async {
    try {
      final doc = await firestore.collection('user').doc(userId).get();

      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data()!);
    } catch (e) {
      return null;
    }
  }

  Future<SellerModel?> getSellerData(String sellerId) async {
    try {
      final doc = await firestore.collection('seller').doc(sellerId).get();

      if (!doc.exists) return null;

      return SellerModel.fromMap(doc.data()!);
    } catch (e) {
      return null;
    }
  }
}