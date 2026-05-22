
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;
  const SubmitButton(
      {super.key, required this.isLoading, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: isLoading
          ? Container(
              decoration: BoxDecoration(
                color: Color(0xFF1A0A3A).withValues(alpha:  0.2),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Color(0xFF1A0A3A).withValues(alpha:  0.3)),
              ),
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Color(0xFF1A0A3A),
                    strokeWidth: 2,
                  ),
                ),
              ),
            )
          : DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFF1A0A3A),
                borderRadius: BorderRadius.circular(10),
               
                
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Color(0xFF0D0D1F).withValues(alpha:  0.2),
                  child: const Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded,
                            color: Colors.white, size: 17),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}