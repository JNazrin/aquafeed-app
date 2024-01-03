import 'package:aquafeed_app/src/data/repositories/user/user_repository.dart';
import 'package:aquafeed_app/src/features/core/models/user_model.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        // Map data
        final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email ?? '',
            fullname: userCredential.user!.displayName ?? ''
        );

        // Save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      SnackbarWidget.warningSnackBar(title: 'Data not saved', message: 'Something went wrong. You can save your data in Profile page');
    }
  }
}