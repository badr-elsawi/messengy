import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  TextEditingController controller;
  TextStyle style;
  String hintText;
  bool obscureText;
  String? errorHint;
  Widget? prefixIcon;
  Widget? suffix;
  int? maxLines;
  TextInputType? keyboardType;



  MyTextInput({
    required this.controller,
    required this.style,
    required this.hintText,
    this.errorHint,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,

      minLines: 1,
      keyboardType: keyboardType,
      controller: controller,
      style: style,
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return errorHint == null ? 'field is required' : errorHint;
        }
      },
      decoration: InputDecoration(

        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
      ),
    );
  }
}
