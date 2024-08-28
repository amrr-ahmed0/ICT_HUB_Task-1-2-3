import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key, required this.data, this.fontSize, this.fontColor});

  String data;
  double? fontSize;
  Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.bold,
        color: fontColor ?? Colors.black,
      ),
    );
  }
}
