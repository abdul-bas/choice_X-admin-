
import 'package:flutter/material.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1A0A3A), Color(0xFF0D0D1F)],
              ),
     
      ),
      padding: const EdgeInsets.all(48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
        


          const SizedBox(height: 16),
          const Text(
            'Admin\nDashboard\nControl Center',
            style: TextStyle(
              color: Color(0xFFF0F4FF),
              fontSize: 38,
              fontWeight: FontWeight.w800,
              height: 1.15,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Insights, control, and management tools\nbuilt for admins.',
            style: TextStyle(
              color: Color(0xFFB0BBCC),
              fontSize: 14,
              height: 1.6,
            ),
          ),

       

      

        

        ],
      ),
    );
  }
}