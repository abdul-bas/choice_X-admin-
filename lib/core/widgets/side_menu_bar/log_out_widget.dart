

import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key, required this.onTap});
  final VoidCallback onTap;
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      
        Container(
          height: 1,
          color: AppColors.border,
        ),
 
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            
            splashColor:   const Color(0xFFE05252).withValues(alpha:  0.10),
            highlightColor: const Color(0xFFE05252).withValues(alpha:  0.06),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 16),
              child: Row(
                children: [
              
                  const Icon(
                    Icons.logout_rounded,
                    size:  17,
                    color: Color(0xFF666666),
                  ),
                  const SizedBox(width: 12),
             
                  const Expanded(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color:       Color(0xFF888888),
                        fontSize:    13,
                        fontWeight:  FontWeight.w500,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                 
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size:  11,
                    color: Color(0xFF444444),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}