import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class CardWidget extends StatelessWidget {
  final String img;
  final String title;

  const CardWidget({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: textColor2,
            blurRadius: 4.0,
            offset: Offset(
              2.0, // Move to right horizontally
              2.0, // Move to bottom Vertically
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(img),
          const Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}