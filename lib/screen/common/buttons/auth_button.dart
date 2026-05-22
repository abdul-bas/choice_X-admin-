import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
const  AuthButton(
      {super.key,
      required this.width,
      this.color,
      required this.text,
      this.textColor,
      this.fontSize,
      this.icon,
      this.function});

  final double width;
  final Color? color;
  final String text;
  final Color? textColor;
  final Icon? icon;
 final Function()? function;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 380, // button width
        height: 48,
        child: TextButton(
          style: TextButton.styleFrom(
            side: BorderSide(
              width: 1,
              color: const Color.fromARGB(39, 0, 0, 0),
            ),
            backgroundColor: color ?? const Color.fromARGB(255, 94, 39, 176),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {
            if (function != null) {
              function!();
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(width: 10),
              Center(
                child: TextInter(
                  text: text,
                  letterSpacing: 0.1,
                  wordSpace: 1,
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: fontSize ?? 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



