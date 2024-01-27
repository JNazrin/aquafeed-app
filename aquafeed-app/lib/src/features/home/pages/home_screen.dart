import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:aquafeed_app/src/features/device/pages/device_screen.dart';
import 'package:aquafeed_app/src/features/core/controllers/user_controller.dart';
import 'package:aquafeed_app/src/features/history_feeding/pages/history_screen.dart';
import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_setup_screen.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/instant_feeding/pages/instant_feeding_screen.dart';
import 'package:aquafeed_app/src/features/profile/pages/profile_screen.dart';
import 'package:aquafeed_app/src/features/tips_section/pages/tips_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/card_widget.dart';
import 'package:aquafeed_app/src/features/ph_level/pages/ph_screen.dart';
import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size; // this is total height of our device
    final controller = Get.put(UserController());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            // height of the container is set to 45%
            height: size.height * .40,
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
          ),
          SafeArea(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text(
                      'Hello,',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                        fontSize: 25,
                      ),
                    ),
                    subtitle: Obx(
                      () => Text(
                        controller.user.value.fullname,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: whiteColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: (){
                        // Navigate to the desired page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        // PH card
                        GestureDetector(
                          child: const CardWidget(
                            img: 'assets/ph_image.png',
                            title: 'pH Level',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const PH()
                              )
                            );
                          },
                        ),

                        // Schedule card
                        GestureDetector(
                          child: const CardWidget(
                            img: 'assets/schedule_image.png',
                            title: 'History',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const History()
                              )
                            );
                          },
                        ),

                        // Feed Now card
                        GestureDetector(
                          child: const CardWidget(
                            img: 'assets/feed.png',
                            title: 'Feed Now',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => InstantFeeding()
                              )
                            );
                          },
                        ),

                        // Tips Section card
                        GestureDetector(
                          child: const CardWidget(
                            img: 'assets/tips_image.png',
                            title: 'Tips Section',
                          ),
                          onTap: () {
                            // Navigate to the desired page
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => const Tips()
                              )
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                    child: Button(
                        onPressed: () {
                          // Navigate to the desired page
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => const ScheduleSetup()
                            )
                          );
                        },
                        text: 'Set Reminders'
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      ),
    );
  }
}