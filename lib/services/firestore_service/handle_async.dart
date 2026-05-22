
import 'package:flutter/material.dart';
Widget? handleAsync<T>({
  required AsyncSnapshot<List<T>> snapshot,
}) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: SizedBox()
    );
  }

  if (snapshot.hasError) {
    return Center(
      child: Text(
        snapshot.error.toString(),
        style: const TextStyle(color: Colors.white60),
      ),
    );
  }

  if (!snapshot.hasData || snapshot.data!.isEmpty) {
    return const Center(
      child: Text(
        'No data available',
        style: TextStyle(color: Colors.white60),
      ),
    );
  }

  return null;
}
