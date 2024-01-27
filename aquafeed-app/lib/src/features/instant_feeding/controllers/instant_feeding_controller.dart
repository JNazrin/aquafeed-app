import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class InstantFeedingController extends GetxController {
  static InstantFeedingController get instance => Get.find();

  Future<void> updateFeedNow() async {
    try {
      CollectionReference devices = FirebaseFirestore.instance.collection('Devices');

      // Update feednow data to true
      await devices.doc('nxJA1TcEgKvGQQnsMEi6').update({
        'feednow': true,
      });

      // Popup message
      SnackbarWidget.successSnackBar(title: 'Success', message: 'You successfully feed the fish!');
    } catch(e) {
      // Handle errors
      print('Error updating data: $e');
    }
  }
}