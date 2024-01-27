import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceModel {
  String? id;
  String? userId;
  String devicename;
  bool feednow;

  DeviceModel({this.id, required this.userId, required this.devicename, required this.feednow});

  // To create an empty device model
  static DeviceModel empty() => DeviceModel(userId: '', devicename: '', feednow: false);

  // Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'devicename': devicename,
      'feednow': feednow,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot
  factory DeviceModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return DeviceModel(
        id: document.id,
        userId: data['userId'] ?? '',
        devicename: data['devicename'] ?? '',
        feednow: data['feednow'] ?? false,
      );
    }
    return DeviceModel.empty();
  }
}