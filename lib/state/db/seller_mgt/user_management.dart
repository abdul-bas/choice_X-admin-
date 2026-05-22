
import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement {
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
Stream<QuerySnapshot<Map<String, dynamic>>>  getUserData() {
  
    return firebaseFirestore.collection('user').snapshots();

   
  }
}