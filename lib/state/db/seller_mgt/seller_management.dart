 
  
import 'package:cloud_firestore/cloud_firestore.dart';

class SellerManagement {
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> getSellerData() {
   
    return firebaseFirestore.collection('seller').snapshots();

   
  }
}