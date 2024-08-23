import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.data,
      this.hint,
      required this.controller,
      required this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.keyBoardType,
      this.obsecurText});

  String data;
  String? hint;
  var controller = TextEditingController();
  String? Function(String?)? validator;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputType? keyBoardType;
  bool? obsecurText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obsecurText ?? false,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.green, width: 3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 3)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.orange, width: 3)),
          label: Text(data),
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}
