import 'package:aquafeed_app/src/data/repositories/device/device_repository.dart';
import 'package:aquafeed_app/src/features/device/models/device_model.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

class AddDeviceController extends GetxController {
  static AddDeviceController get instance => Get.find();

  // Variables
  final devicename = TextEditingController(); // controller for device name input

  GlobalKey<FormState> addDeviceFormKey = GlobalKey<FormState>();

  void addDeviceController() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      final newDevice = DeviceModel(
          userId: AuthenticationRepository.instance.authUser?.uid,
          devicename: devicename.text.trim(),
          feednow: false
      );

      final deviceRepository = Get.put(DeviceRepository());
      await deviceRepository.saveDeviceRecord(newDevice);

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

      // Success message
      SnackbarWidget.successSnackBar(title: 'Congratulations', message: 'You have already add the device');

    } catch(e) {
      // Show some Generic Error to the user
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }
}