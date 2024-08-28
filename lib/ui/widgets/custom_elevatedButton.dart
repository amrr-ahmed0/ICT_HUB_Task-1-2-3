import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backGroundColor,
      this.borderRadius,
      this.textSize,
      this.textColor,
      this.isLoading = false});

  String text;
  double? borderRadius;
  Color? backGroundColor;
  void Function()? onPressed;
  Color? textColor;
  double? textSize;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
          : Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.white, fontSize: textSize ?? 18),
            ),
      style: ElevatedButton.styleFrom(
          backgroundColor: backGroundColor ?? Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 15))),
    );
  }
}
