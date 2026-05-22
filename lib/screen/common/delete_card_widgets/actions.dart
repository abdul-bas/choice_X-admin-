import 'package:flutter/material.dart';
Widget buildDeleteActions({
  required BuildContext context,
  required ValueNotifier<bool> isLoading,
  required Future<void> Function() onDelete,
  required String title,
  IconData icon = Icons.delete_outline_rounded,
}) {
  return ValueListenableBuilder<bool>(
    valueListenable: isLoading,
    builder: (context, loading, _) {
      return Row(
        children: [
          /// Cancel Button
          Expanded(
            child: GestureDetector(
              onTap: loading ? null : () => Navigator.of(context).pop(),
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.08),
                    width: 0.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// Delete Button
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: loading
                  ? null
                  : () async {
                      isLoading.value = true;

                      await onDelete();

                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }

                      isLoading.value = false;
                    },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 42,
                decoration: BoxDecoration(
                  color: loading
                      ? const Color(0xFFE24B4A).withValues(alpha: 0.06)
                      : const Color(0xFFE24B4A).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFE24B4A).withValues(alpha: 0.35),
                    width: 0.5,
                  ),
                ),
                alignment: Alignment.center,
                child: loading
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFFE24B4A),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icon,
                            color: const Color(0xFFE24B4A),
                            size: 15,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Delete $title',
                            style: const TextStyle(
                              color: Color(0xFFE24B4A),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      );
    },
  );
}