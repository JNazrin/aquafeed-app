import 'package:aquafeed_app/src/features/authentication/pages/login_screen.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:aquafeed_app/src/features/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/data/repositories/exceptions/firebase_auth_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    screenRedirect();
  }

  void screenRedirect() {
    final user = _auth.currentUser;
    // if the user logged in
    if (user != null) {
      Get.offAll(() => const Home()); // redirect to Home page
    } else {
      Get.offAll(() => const Welcome()); // redirect to Welcome page
    }
  }

  /* --------------- Email and Password SignIn --------------- */

  // Login Authentication

  // Register Authentication
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Forget Password

  /* --------------- Google SignIn --------------- */

  // Google Authentication

  /* --------------- Logout --------------- */

  // Logout Authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => Login());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
