import 'package:aquafeed_app/src/features/authentication/controllers/login_controller.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/authentication/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/aquafeed_logo.png',
                    height: 150,
                  ),

                  const SizedBox(height: 30),

                  // Welcome sentence
                  const Text(
                    'Welcome back you\'ve been missed',
                    style: TextStyle(
                      color: textColor2,
                      fontSize: 17,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Email textfield
                  TextFieldWidget(
                    controller: controller.email,
                    hintText: 'Enter Email',
                    obscureText: false,
                    validator: (value) => Validations.validateEmptyText('Email', value),
                  ),

                  const SizedBox(height: 10),

                  // Password textfield
                  TextFieldWidget(
                    controller: controller.password,
                    hintText: 'Enter Password',
                    obscureText: true,
                    validator: (value) => Validations.validateEmptyText('Password', value),
                  ),

                  const SizedBox(height: 10),

                  // Forgot password
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Password?',
                        style: TextStyle(color: textColor2),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  Button(
                    onPressed: () => controller.loginController(),
                    text: 'Login',
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFB9C0C9),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: textColor2),
                        ),
                      ),

                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color(0xFFB9C0C9),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // Google sign in button
                  IconButton(
                    onPressed: () => controller.googleSignIn(),
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/google.png',
                          height: 50,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // Don't have account? Register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have account?',
                        style: TextStyle(
                          color: textColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: () {
                          // Navigate to the desired page
                          Get.to(const Register());
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
