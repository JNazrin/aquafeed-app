import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_setup_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/components/schedule_card_widget.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
                  'Feeding Schedule',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                Text(
                  'Your Fish\'s Mealtime',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                SizedBox(height: 40),

                // schedule list
                ScheduleCard(
                  label: 'Label', 
                  date: 'Fri, 13 Okt', 
                  time: '12:00 PM', 
                  typeFeed: 'Schedule'
                ),

                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // history button
                    Text(
                      'History',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: primaryColor
                      ),
                    ),

                    SizedBox(width: 40),

                    // add schedule button
                    Button(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleSetup()));
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
