import 'package:aquafeed_app/src/features/device/models/device_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

class DeviceRepository extends GetxController {
  static DeviceRepository get instance => Get.find();

  // Firebase Firestore
  final FirebaseFirestore _dbFirestore = FirebaseFirestore.instance;
  
  // Function to save device details
  Future<void> saveDeviceRecord(DeviceModel device) async {
    try {
      await _dbFirestore.collection("Devices").doc(device.id).set(device.toJson());
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  
  //Function to fetch device details
  // Future<DeviceModel> fetchDeviceRecord() async {
  //   try{
  //     final documentSnapshot = await _dbFirestore.collection("Devices").where("userId", isEqualTo: AuthenticationRepository.instance.authUser?.uid).get();
  //     if (documentSnapshot.size.exists) {
  //       return DeviceModel.fromSnapshot(documentSnapshot);
  //     } else {
  //       return DeviceModel.empty();
  //     }
  //   } catch(e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  Future<List<DeviceModel>> fetchDeviceRecord() async {
    try{
      final documentSnapshot = await _dbFirestore.collection("Devices").where("userId", isEqualTo: AuthenticationRepository.instance.authUser?.uid).get();
      return documentSnapshot.docs.map((e) => DeviceModel.fromSnapshot(e)).toList();
    } catch(e) {
      throw 'Something went wrong. Please try again';
    }
  }
}