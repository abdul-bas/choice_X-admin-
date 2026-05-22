
import 'package:flutter/material.dart';

class UserStatData {
  final String label, value, footer;
  final IconData icon;
  final Color color;
  const UserStatData({
    required this.label, required this.value, required this.footer,
    required this.icon, required this.color,
  });
}
