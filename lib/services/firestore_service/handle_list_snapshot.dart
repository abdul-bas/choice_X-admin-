import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget? handleListSnapshot({
  required AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
}) {
 

  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white60,
      ),
    );
  }

  if (snapshot.hasError) {
    return Center(
        child: Text(
      snapshot.error.toString(),
      style: TextStyle(color: Colors.white60),
    ));
  }

 

  return null;
}
