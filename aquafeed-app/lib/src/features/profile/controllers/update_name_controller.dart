import 'package:aquafeed_app/src/data/repositories/user/user_repository.dart';
import 'package:aquafeed_app/src/features/core/controllers/user_controller.dart';
import 'package:aquafeed_app/src/features/profile/pages/profile_screen.dart';
import 'package:aquafeed_app/src/utils/components/snackbar_widget.dart';
import 'package:aquafeed_app/src/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final fullname = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  // Init user data when Name screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch user record
  Future<void> initializeNames() async {
    fullname.text = userController.user.value.fullname;
  }

  Future<void> updateUserName() async {
    try {
      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        return;
      }

      // Form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        return;
      }

      // Update user record in the Firebase Firestore
      Map<String, dynamic> name = {'fullname': fullname.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.fullname = fullname.text.trim();

      // Show success message
      SnackbarWidget.successSnackBar(title: 'Congratulations', message: 'Your date has been updated');

      // Move to previous screen
      Get.off(() => const Profile());
    }
    catch (e) {
      SnackbarWidget.errorSnackBar(title: 'Error!', message: e.toString());
    }
  }
}