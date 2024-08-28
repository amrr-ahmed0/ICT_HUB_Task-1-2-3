import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSnackbar extends StatelessWidget {
  CustomSnackbar(
      {super.key, required this.text, this.textColor, this.backgroundColor});

  String text;
  Color? textColor;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: CustomText(
        data: text,
        fontColor: textColor ?? Colors.white,
      ),
      backgroundColor: backgroundColor ?? Colors.grey,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ;
  }
}
