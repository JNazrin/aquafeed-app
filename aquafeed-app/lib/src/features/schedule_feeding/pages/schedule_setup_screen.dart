import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/features/schedule_feeding/pages/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class ScheduleSetup extends StatefulWidget {
  const ScheduleSetup({super.key});

  @override
  State<ScheduleSetup> createState() => _ScheduleSetupState();
}

class _ScheduleSetupState extends State<ScheduleSetup> {
  // create timeOfDay variable
  TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 0);

  // create showTimePicker method
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

                // set timer section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _timeOfDay.format(context).toString(),
                      style: TextStyle(
                        color: textColor,
                        fontSize: 23,
                      ),
                    ),

                    // button to set the time
                    GestureDetector(
                      onTap: () {
                        _showTimePicker();
                      },
                      child: Text(
                        '>',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Divider(
                  height: 50,
                  thickness: 2,
                ),

                // repeat day section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Repeat',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Every Monday >',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Divider(
                  height: 50,
                  thickness: 2,
                ),

                // label section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Label',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Breakfast >',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Divider(
                  height: 50,
                  thickness: 2,
                ),

                // notification section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notification',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Turn on >',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50),

                // save button
                Button(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule()));
                  },
                  text: 'Save',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
