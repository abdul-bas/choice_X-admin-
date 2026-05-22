import 'dart:math';
import 'package:choice_x_admin/core/constants/app_colors.dart';
import 'package:choice_x_admin/screen/admin_access/admin_access.dart';
import 'package:choice_x_admin/screen/common/texts/crimpson.dart';
import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:choice_x_admin/services/admin_auth_service/admin_register_services.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotateAnim;
  late Animation<double> scaleAnim;
  late Animation<double> opacityAnim;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdminAuthService().authValidation(context);
    });
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    rotateAnim = Tween<double>(begin: -1, end: 4 * pi)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticIn));
    scaleAnim = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
    opacityAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    super.initState();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextButton(
                            style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0))),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white)),
                            onPressed: () {
                              Navigator.of(context).push((MaterialPageRoute(
                                  builder: (builder) => AdminAccess())));
                            },
                            child: SizedBox(
                                height: 40,
                                width: 80,
                                child: Center(
                                    child: TextCrimson(
                                  text: 'Get Start',
                                  fontSize: 15,
                                  color: Colors.black,
                                  textAlign: TextAlign.center,
                                  letterSpacing: 1,
                                ))))),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: rotateAnim.value,
                            child: Transform.scale(
                              scale: scaleAnim.value,
                              child: Opacity(
                                opacity: opacityAnim.value,
                                child: Container(
                                  height: 300,
                                  width: 400,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/new_One-removebg-preview.png'))),
                                ),
                              ),
                            ),
                          );
                        }),
                    if (!isMobile)
                      SizedBox(
                        height: 310,
                      ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextInter(
                              text: 'ChoiceX Admin Panel',
                              fontSize: isMobile ? 25 : 30,
                              letterSpacing: 0.5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                                width: 500,
                                child: TextCrimson(
                                  textOverflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  text:
                                      'Manage products, users, orders\n& monitor business operations efficiently',
                                  color: Colors.grey,
                                  fontSize: isMobile ? 10 : 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 2,
                                  wordSpace: 1,
                                )),
                          ],
                        ))
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
