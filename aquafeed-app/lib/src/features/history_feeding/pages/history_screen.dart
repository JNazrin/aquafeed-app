import 'package:aquafeed_app/src/features/history_feeding/controllers/history_controller.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/history_card_widget.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {

    final historyController = Get.put(HistoryController());

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
                  'Feeding History',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                const Text(
                  'Your Fish\'s Mealtime Record',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                const SizedBox(height: 40),

                // history card
                // const ScheduleCard(
                //     label: 'Label',
                //     date: 'Fri, 13 Okt',
                //     time: '12:00 PM',
                //     typeFeed: 'Schedule'
                // ),

                Obx(() =>
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisExtent: 150,
                        mainAxisSpacing: 10
                    ),
                    itemCount: historyController.listHistory.length,
                    itemBuilder: (_, index) => HistoryCard(history: historyController.listHistory[index]),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}