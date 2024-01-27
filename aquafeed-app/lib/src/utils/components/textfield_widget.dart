import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final bool obscureText;
  final hintText;
  final validator;

  const TextFieldWidget({super.key, required this.controller, required this.obscureText, required this.hintText, required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFB9C0C9)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor:  Colors.grey.shade100,
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xFFB9C0C9)),
      ),
    );
  }
}
