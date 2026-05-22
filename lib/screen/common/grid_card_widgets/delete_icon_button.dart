
import 'package:flutter/material.dart';

class DeleteIconBtn extends StatelessWidget {
  const DeleteIconBtn({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFE24B4A).withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: const Color(0xFFE24B4A).withValues(alpha: 0.2),
            width: 0.5,
          ),
        ),
        child: const Icon(
          Icons.delete_outline_rounded,
          size: 13,
          color: Color(0xFFE24B4A),
        ),
      ),
    );
  }
}