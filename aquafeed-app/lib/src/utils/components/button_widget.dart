import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const Button({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ));
  }
}
