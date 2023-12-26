import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/schedule_card_widget.dart';

class HistorySchedule extends StatefulWidget {
  const HistorySchedule({super.key});

  @override
  State<HistorySchedule> createState() => _HistoryScheduleState();
}

class _HistoryScheduleState extends State<HistorySchedule> {
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
                  'Feeding History',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                Text(
                  'Your Fish\'s Mealtime Record',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                SizedBox(height: 40),

                // history card
                ScheduleCard(
                  label: 'Label', 
                  date: 'Fri, 13 Okt', 
                  time: '12:00 PM', 
                  typeFeed: 'Schedule'
                ),

                SizedBox(height: 10),

                ScheduleCard(
                  label: 'Label 2', 
                  date: 'Sat, 14 Okt', 
                  time: '2:00 PM', 
                  typeFeed: 'Instant'
                ),

                SizedBox(height: 10),

                ScheduleCard(
                  label: 'Label 3', 
                  date: 'Sun, 15 Okt', 
                  time: '6:00 AM', 
                  typeFeed: 'Schedule'
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}