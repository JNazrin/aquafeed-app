import 'package:aquafeed_app/src/features/authentication/pages/login_screen.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:aquafeed_app/src/features/core/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/data/repositories/exceptions/firebase_auth_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
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
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Register Authentication
  Future<UserCredential> createUserWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // Forget Password

  /* --------------- Google SignIn --------------- */

  // Google Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Get the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once sign in, return a user credential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /* --------------- Logout --------------- */

  // Logout Authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const Login());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /* --------------- Arduino --------------- */

  // Function to get userId for current user
  Future<String?> getUserId() async {
    try {

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;
        return userId;
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
