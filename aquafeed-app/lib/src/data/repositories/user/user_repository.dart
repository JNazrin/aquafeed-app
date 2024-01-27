import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:aquafeed_app/src/features/core/models/user_model.dart';
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

  // Function to fetch user detail from user id
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _dbFirestore.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _dbFirestore.collection("Users").doc(updatedUser.id).update(updatedUser.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Update any field in specific user collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _dbFirestore.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Function to remove user data from Firestore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _dbFirestore.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
