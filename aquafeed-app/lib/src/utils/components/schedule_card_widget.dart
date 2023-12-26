import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class ScheduleCard extends StatelessWidget {
  final String label;
  final String date;
  final String time;
  final String typeFeed;

  const ScheduleCard({super.key, required this.label, required this.date, required this.time, required this.typeFeed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: textColor2,
            blurRadius: 4.0,
            offset: Offset(
              2.0, // Move to right horizontally
              2.0, // Move to bottom Vertically
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // label and date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 17,
                    color: textColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 17,
                    color: primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // time
            Row(
              children: [
                const Icon(Icons.access_time),
                const SizedBox(width: 10),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 17,
                    color: textColor2,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),

            const SizedBox(height: 5),

            // type of feeding "Schedule or Instant"
            Row(
              children: [
                const Icon(Icons.ad_units),
                const SizedBox(width: 10),
                Text(
                  typeFeed,
                  style: const TextStyle(
                    fontSize: 17,
                    color: textColor2,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),

            // delete button
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
