import 'package:aquafeed_app/src/data/repositories/history/history_repository.dart';
import 'package:aquafeed_app/src/features/history_feeding/models/history_model.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:aquafeed_app/src/utils/helpers/formatter.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddHistoryController extends GetxController {
  static AddHistoryController get instance => Get.find();

  GlobalKey<FormState> addHistoryFormKey = GlobalKey<FormState>();

  Future<void> addHistoryController() async {
    try {
      // Check the internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        return;
      }

      DateTime currentDate = DateTime.now();
      DateTime currentTime = DateTime.now();

      // Format DateTime, example: 2024-01-01
      String formattedCurrentDate = Formatter.formatDate(currentDate);
      String formattedCurrentTime = Formatter.formatTime(currentTime);

      final newHistory = HistoryModel(
          dateFeed: formattedCurrentDate,
          timeFeed: formattedCurrentTime,
      );

      final historyRepository = Get.put(HistoryRepository());
      await historyRepository.saveHistoryRecord(newHistory);

    } catch(e) {
      // Show some Generic Error to the user
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }

}