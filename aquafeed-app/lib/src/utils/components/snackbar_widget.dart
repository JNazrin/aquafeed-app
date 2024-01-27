import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';

class SnackbarWidget {
  // success snackbar
  static successSnackBar({required title, message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: false,
      colorText: whiteColor,
      backgroundColor: textColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      borderRadius: 5.0,
    );
  }

  // warning snackbar
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: false,
      colorText: whiteColor,
      backgroundColor: textColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20.0),
      borderRadius: 5.0,
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: false,
      colorText: whiteColor,
      backgroundColor: textColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(20.0),
      borderRadius: 5.0,
    );
  }
}