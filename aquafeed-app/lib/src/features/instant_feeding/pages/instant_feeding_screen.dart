import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class InstantFeeding extends StatelessWidget {
  const InstantFeeding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title page
                Text(
                  'Instant Feeding',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                Text(
                  'Click the button to\ninstantly feed your fish',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                SizedBox(height: 130),

                // feed button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: FittedBox(
                        child: FloatingActionButton(
                          backgroundColor: whiteColor,
                          onPressed: () {},
                          child: Text(
                            'Feed',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}