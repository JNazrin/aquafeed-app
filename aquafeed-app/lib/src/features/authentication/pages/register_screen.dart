import 'package:aquafeed_app/src/features/authentication/controllers/register_controller.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/features/authentication/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: controller.registerFormKey,
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
                    'Create your account and get started!',
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
                    validator: (value) => Validations.validateEmail(value),
                  ),
            
                  const SizedBox(height: 10),
            
                  // Password textfield
                  TextFieldWidget(
                    controller: controller.password,
                    hintText: 'Enter Password',
                    obscureText: true,
                    validator: (value) => Validations.validatePassword(value),
                  ),
            
                  const SizedBox(height: 10),
            
                  // Fullname textfield
                  TextFieldWidget(
                    controller: controller.fullname,
                    hintText: 'Enter Full Name',
                    obscureText: false,
                    validator: (value) => Validations.validateEmptyText('Fullname', value),
                  ),
            
                  const SizedBox(height: 25),
            
                  // register button
                  Button(
                    onPressed: () => controller.registerController(),
                    text: 'Register',
                  ),
            
                  const SizedBox(height: 50),
            
                  // Already have an account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: textColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(width: 4),

                      GestureDetector(
                        onTap: () {
                          // Navigate to the desired page
                          Get.to(const Login());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}