import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  TextEditingController controller;
  TextStyle style;
  String hintText;
  bool obscureText;

  Widget? prefixIcon;
  Widget? suffix;

  MyTextInput({
    required this.controller,
    required this.style,
    required this.hintText,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon!,
        suffix: suffix,
      ),
    );
  }
}
