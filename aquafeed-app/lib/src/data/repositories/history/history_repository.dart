import 'package:aquafeed_app/src/data/repositories/exceptions/firebase_auth_exception.dart';
import 'package:aquafeed_app/src/features/history_feeding/models/history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

class HistoryRepository extends GetxController {
  static HistoryRepository get instance => Get.find();

  // Firebase Firestore
  final FirebaseFirestore _dbFirestore = FirebaseFirestore.instance;

  // Function to save history details
  Future<void> saveHistoryRecord(HistoryModel history) async {
    try {
      await _dbFirestore.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).collection("History").doc(history.id).set(history.toJson());
    } catch(e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to delete history
  Future<void> deleteHistoryRecord(String id) async {
    try {
      await _dbFirestore.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).collection("History").doc(id).delete();
    } catch(e) {
      throw 'Error!';
    }
  }

}