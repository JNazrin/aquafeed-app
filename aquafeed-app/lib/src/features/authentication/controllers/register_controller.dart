import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:aquafeed_app/src/data/repositories/user/user_repository.dart';
import 'package:aquafeed_app/src/features/core/models/user_model.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variables
  final email = TextEditingController(); // controller for email input
  final password = TextEditingController(); // controller for password input
  final fullname = TextEditingController(); // controller for fullname input

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>(); // form key for form validation

  void registerController() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form validation
      if (!registerFormKey.currentState!.validate()) {
        return;
      }

      // Register user into Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.createUserWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save authenticated data into firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        fullname: fullname.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      AuthenticationRepository.instance.screenRedirect();

      // Success message
      SnackbarWidget.successSnackBar(
        title: 'Congratulations', message: 'You account has been created!'
      );
    } catch (e) {
      // Show some Generic Error to the user
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    } finally {}
  }
}
