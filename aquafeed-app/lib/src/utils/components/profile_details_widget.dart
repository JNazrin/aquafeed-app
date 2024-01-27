import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class ProfileDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProfileDetails({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
            color: textColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
            color: textColor2, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
