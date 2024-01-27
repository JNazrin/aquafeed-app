import 'package:aquafeed_app/src/features/device/controllers/add_device_controller.dart';
import 'package:aquafeed_app/src/features/device/controllers/device_controller.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(AddDeviceController());

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
              child: Form(
                key: controller.addDeviceFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Enter Device Details',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 40),

                      TextFieldWidget(
                          controller: controller.devicename,
                          obscureText: false,
                          hintText: 'Device Name',
                          validator: (value) => Validations.validateEmptyText('Device Name', value)
                      ),

                      const SizedBox(height: 40),

                      Button(
                          onPressed: () => controller.addDeviceController(),
                          text: 'Submit',
                      )
                    ],
                  )
              )
            ),
          )
      ),
    );
  }
}
