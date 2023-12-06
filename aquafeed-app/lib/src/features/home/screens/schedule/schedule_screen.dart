import 'package:aquafeed_app/src/features/home/screens/schedule/schedule_setup.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/constants/colors.dart';
import 'package:aquafeed_app/src/components/widgets/button_widget.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // create timeOfDay variable
  TimeOfDay _timeOfDay = TimeOfDay(hour: 8, minute: 30);

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

                SizedBox(height: 50),

                Button(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleSetup()));
                  }, 
                  text: 'Add Schedule'
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // show time picker method
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }
}
