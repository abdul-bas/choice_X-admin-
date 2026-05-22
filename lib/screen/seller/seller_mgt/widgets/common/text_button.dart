

import 'package:choice_x_admin/screen/common/texts/inter.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    this.buttonColor,
    this.text,
    this.textcolor,
    this.buttonHight,
    this.textSize,
    this.radius,
    this.border,
    this.fontWeight,
    this.padding,
    this.function,
    this.borderColor,
    this.buttonWidth,
  });

  final Color? textcolor;
  final String? text;
  final Color? buttonColor;
  final double? buttonHight;
  final double? buttonWidth;
  final Function? function;
  final double? textSize;
  final double? radius;
  final bool? border;
  final double? padding;
  final Color? borderColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHight,
      width: buttonWidth,
      child: TextButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: padding ?? 13),
          ),
          backgroundColor: WidgetStatePropertyAll(buttonColor ?? Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: border != null
                  ? BorderSide(width: 1, color: borderColor ?? Colors.white70)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(radius ?? 5),
            ),
          ),
        ),
        onPressed: () {
          if (function != null) {
            function!();
          }
        },
        child: TextInter(
          text: text ?? 'Accept',
          fontSize: textSize,
          color: textcolor ?? Colors.black,
          letterSpacing: 0.5,
          fontWeight: fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
