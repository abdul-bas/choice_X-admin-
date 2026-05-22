import 'package:choice_x_admin/core/widgets/admin_dashbord/admin_dashbord.dart';
import 'package:choice_x_admin/model/admin_model/admin_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> loginAdmin({
    required String email,
    required String password,
  }) async {
    try {
      final cleanEmail = email.trim();
      final cleanPassword = password.trim();

      if (cleanEmail != 'admin@gmail.com') {
        return 'Only authorized admin can login.';
      }

      final userCredential = await auth.signInWithEmailAndPassword(
        email: cleanEmail,
        password: cleanPassword,
      );

      final uid = userCredential.user!.uid;

      final doc = await firestore.collection('admins').doc(uid).get();

      if (!doc.exists) {
        final model = AdminModel(
            uid: uid,
            name: 'admin',
            email: email,
            phone: '8590371113',
            role: 'admin');
        firestore
            .collection('admins')
            .doc(uid)
            .set(model.toMap(), SetOptions(merge: true));
      }

      return 'Admin login successful';
    } on FirebaseAuthException catch (e) {
      return 'Firebase error: ${e.code}';
    } catch (e) {
      return e.toString();
    }
  }

  authValidation(BuildContext context) async {
    final User? user = auth.currentUser;
    if (user != null) {
      await Future.delayed(Duration(seconds: 1));

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AdminDashbord(),
          ));
    }
  }

  Future<void> logOut() async {
    if (auth.currentUser != null) {
      await auth.signOut();
      
    }
    
  }
}
