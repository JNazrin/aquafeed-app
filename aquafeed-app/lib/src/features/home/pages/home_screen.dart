import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/instant_feeding/pages/instant_feeding_screen.dart';
import 'package:aquafeed_app/src/features/profile/pages/profile_screen.dart';
import 'package:aquafeed_app/src/features/tips_section/pages/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/card_widget.dart';
import 'package:aquafeed_app/src/features/ph_level/pages/ph_screen.dart';
import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var size =
        MediaQuery.of(context).size; // this is total height of our device

    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height of the container is set to 45%
            height: size.height * .40,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
          ),
          SafeArea(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title header
                  Text(
                    'Good Morning\nJoe',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                      fontSize: 27,
                    ),
                  ),

                  SizedBox(height: 50),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        // PH card
                        GestureDetector(
                          child: CardWidget(
                            img: 'assets/ph_image.png',
                            title: 'pH Level',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PH()));
                          },
                        ),

                        // Schedule card
                        GestureDetector(
                          child: CardWidget(
                            img: 'assets/schedule_image.png',
                            title: 'Schedule',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Schedule()));
                          },
                        ),

                        // Feed Now card
                        GestureDetector(
                          child: CardWidget(
                            img: 'assets/feed.png',
                            title: 'Feed Now',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => InstantFeeding()));
                          },
                        ),

                        // Tips Section card
                        GestureDetector(
                          child: CardWidget(
                            img: 'assets/tips_image.png',
                            title: 'Tips Section',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Tips()));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Button(
                      onPressed: () {
                        // Navigate to the desired page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                      }, 
                      text: 'Profile (temporary)'
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}