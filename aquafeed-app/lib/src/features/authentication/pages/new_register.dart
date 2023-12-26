import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:aquafeed_app/src/features/authentication/controllers/register_controller.dart';

class NewRegister extends StatelessWidget {
  const NewRegister({super.key});

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

                  TextFormField(
                    controller: controller.email,
                    validator: (value) => Validations.validateEmail(value),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFB9C0C9)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor:  Colors.grey.shade100,
                      hintText: 'Enter Email',
                      hintStyle: const TextStyle(color: Color(0xFFB9C0C9)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: controller.password,
                    validator: (value) => Validations.validatePassword(value),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFB9C0C9)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor:  Colors.grey.shade100,
                      hintText: 'Enter Password',
                      hintStyle: const TextStyle(color: Color(0xFFB9C0C9)),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: controller.fullname,
                    validator: (value) => Validations.validateEmptyText('FullName', value),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFB9C0C9)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor:  Colors.grey.shade100,
                      hintText: 'Enter Fullname',
                      hintStyle: const TextStyle(color: Color(0xFFB9C0C9)),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Button(
                    onPressed: () => controller.registerUser(),
                    text: 'Register'
                  )
                ],
              )
            ),
          ),
        )
      ),
    );
  }
}