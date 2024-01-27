import 'dart:ffi';
import 'package:aquafeed_app/src/features/device/controllers/device_controller.dart';
import 'package:aquafeed_app/src/features/device/models/device_model.dart';
import 'package:aquafeed_app/src/features/device/pages/add_device_screen.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:get/get.dart';

class AddDevice extends StatelessWidget {
  const AddDevice({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(DeviceController());

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
                  'Add Device',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Sub title
                const Text(
                  'Please connect to your device',
                  style: TextStyle(
                    color: textColor2,
                    fontSize: 17,
                  ),
                ),

                // Notes
                const Text(
                  '**Please make sure you turn on the wifi',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  controller.device.value.devicename,
                  style: const TextStyle(
                    color: primaryColor,
                  ),
                ),

                const SizedBox(height: 40),

                Button(
                    onPressed: () {
                      // Navigate to the desired page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeviceDetails()));
                    },
                    text: 'Add Device'
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
