import 'package:aquafeed_app/src/features/history_feeding/controllers/add_history_controller.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/instant_feeding/controllers/instant_feeding_controller.dart';
import 'package:get/get.dart';

class InstantFeeding extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(InstantFeedingController());
    final controller2 = Get.put(AddHistoryController());

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
          onPressed: () {
            // Navigate to the desired page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Form(
              key: controller2.addHistoryFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title page
                  const Text(
                    'Instant Feeding',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Sub title
                  const Text(
                    'Click the button to\ninstantly feed your fish',
                    style: TextStyle(
                      color: textColor2,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 130),

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
                            onPressed: () {
                              controller.updateFeedNow();
                              controller2.addHistoryController();
                            },
                            // onPressed: () => controller.updateFeedNow(),
                            child: const Text(
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
      ),
    );
  }
}