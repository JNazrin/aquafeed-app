import 'package:aquafeed_app/src/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const TextFieldWidget({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
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
      ),
    );
  }
}
