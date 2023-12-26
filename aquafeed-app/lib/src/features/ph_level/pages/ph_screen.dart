import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PH extends StatelessWidget {
  const PH({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title page
              Text(
                'pH Level',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Sub title
              Text(
                'Creating the Perfect\nWater World for Your Fish',
                style: TextStyle(
                  color: textColor2,
                  fontSize: 17,
                ),
              ),

              SizedBox(height: 200),

              // ph Level
              Center(
                child: Text(
                  'ph Level',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Center(
                child: Text(
                  '6.8',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Center(
                child: Text(
                  'Normal',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}