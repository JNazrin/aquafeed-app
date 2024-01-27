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
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 12, minute: 0);

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
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
          onPressed: () {
            // Navigate to the desired page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Schedule()));
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
                  'Add Reminders',
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

                // set timer section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _timeOfDay.format(context).toString(),
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 23,
                      ),
                    ),

                    // button to set the time
                    GestureDetector(
                      onTap: () {
                        _showTimePicker();
                      },
                      child: const Text(
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

                const Divider(
                  height: 50,
                  thickness: 2,
                ),

                // repeat day section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Repeat',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
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

                const Divider(
                  height: 50,
                  thickness: 2,
                ),

                // label section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Label',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
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

                const Divider(
                  height: 50,
                  thickness: 2,
                ),

                // notification section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notification',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                      ),
                    ),

                    // button to set repeat
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
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

                const SizedBox(height: 50),

                // save button
                Button(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Schedule()));
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
