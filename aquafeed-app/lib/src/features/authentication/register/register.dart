import 'package:aquafeed_app/src/components/widgets/button_widget.dart';
import 'package:aquafeed_app/src/components/widgets/textfield_widget.dart';
import 'package:aquafeed_app/src/features/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/constants/colors.dart';

class Register extends StatelessWidget {
  Register({super.key});

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();

  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                  controller: emailController, 
                  hintText: 'Enter Email', 
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password textfield
                TextFieldWidget(
                  controller: passwordController, 
                  hintText: 'Enter Password', 
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Firstname textfield
                TextFieldWidget(
                  controller: fullNameController,
                  hintText: 'Enter Full Name',
                  obscureText: false,
                ),

                const SizedBox(height: 25),

                // register button
                Button(
                  onTap: registerUser, 
                  text: 'Register',
                ),

                const SizedBox(height: 50),

                // Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: textColor2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 4),

                    GestureDetector(
                      onTap: () {
                        // Navigate to the desired page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
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
    );
  }
}
