 
  
import 'package:cloud_firestore/cloud_firestore.dart';

class SellerManagement {
   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> getSellerData() {
   
    return firebaseFirestore.collection('seller').snapshots();

   
  }
 Future<QuerySnapshot<Map<String, dynamic>>>  getSeller() {
   
    return firebaseFirestore.collection('seller').get();

   
  }
}