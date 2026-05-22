import 'package:flutter/material.dart';

Widget? handleSnapshot(AsyncSnapshot snapshot, {bool? circleProgress}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    if (circleProgress != null && circleProgress == true) {
      return Center(child: const CircularProgressIndicator());
    }
    return SizedBox();
  }

  if (snapshot.hasError) {
    return Center(child: Text("Error: ${snapshot.error}"));
  }

  if (!snapshot.hasData) {
    return const Center(child: Text("No data found"));
  }

  return null;
}
