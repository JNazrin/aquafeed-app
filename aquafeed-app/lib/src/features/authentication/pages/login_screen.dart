import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/authentication/pages/register_screen.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';

class Login extends StatelessWidget {
  Login({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  controller: emailController,
                  hintText: 'Enter Email',
                  obscureText: false,
                  validator: (value) => Validations.validateEmptyText('Email', value),
                ),
          
                const SizedBox(height: 10),
          
                // Password textfield
                TextFieldWidget(
                  controller: passwordController, 
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
                  onPressed: () {
                    // Navigate to the desired page
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/google.png',
                      height: 50,
                    ),
                  ],
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
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
        )
      )
    );
  }
}
