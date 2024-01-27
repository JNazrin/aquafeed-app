import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';
import 'package:aquafeed_app/src/features/core/controllers/user_controller.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class LoginController extends GetxController {
  // Variables
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Login with email and password
  void loginController() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Form validation
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Login user with email and password
      final userCredential = await AuthenticationRepository.instance.signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

      // Success message
      SnackbarWidget.successSnackBar(
          title: 'Congratulations', message: 'You successfully logged in'
      );
    } catch (e) {
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }

  // Login with Google account
  void googleSignIn() async {
    try {
      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Google authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredential);

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

      // Success message
      SnackbarWidget.successSnackBar(
          title: 'Congratulations', message: 'You successfully logged in'
      );

    } catch (e) {
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }
}