import 'dart:typed_data';

import 'package:flutter/material.dart';

class CatImage extends StatelessWidget {
  const CatImage({super.key, required this.bytes});
  final Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: bytes != null
          ? Image.memory(bytes!, fit: BoxFit.cover)
          : ColoredBox(
              color: Colors.white.withValues(alpha: 0.03),
              child: Icon(
                Icons.image_not_supported_rounded,
                size: 20,
                color: Colors.white.withValues(alpha: 0.12),
              ),
            ),
    );
  }
}
