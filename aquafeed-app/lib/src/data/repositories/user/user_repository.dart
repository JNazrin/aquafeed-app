import 'package:aquafeed_app/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/data/repositories/exceptions/firebase_auth_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // Firebase Firestore
  final FirebaseFirestore _dbFirestore = FirebaseFirestore.instance;

  // Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _dbFirestore.collection("Users").doc(user.id).set(user.toJson());
      // await _dbRealTime.ref().child("Users").child(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
