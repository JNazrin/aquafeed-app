import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:aquafeed_app/src/features/history_feeding/pages/history_screen.dart';
import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/components/history_card_widget.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title page
                const Text(
                  'Feeding Schedule',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                const Text(
                  'Your Fish\'s Mealtime',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 40),

                // schedule list
                // const HistoryCard(
                //     history: history
                // ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // history button
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const History())),
                      child: const Text(
                        'History',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: primaryColor
                        ),
                      ),
                    ),

                    const SizedBox(width: 40),

                    // add schedule button
                    Button(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleSetup()));
                      }, 
                      text: 'Add +'
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
