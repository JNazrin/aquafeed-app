import 'package:aquafeed_app/src/features/core/controllers/user_controller.dart';
import 'package:aquafeed_app/src/features/profile/controllers/update_name_controller.dart';
import 'package:aquafeed_app/src/features/profile/pages/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(UpdateNameController());
    final userController = UserController.instance;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
          onPressed: () {
            // Navigate to the desired page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(image: AssetImage('assets/avatar.png')),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: whiteColor,
                          ),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Edit your name',
                    style: TextStyle(
                        fontSize: 17,
                        color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // profile details
                  TextFieldWidget(
                    controller: controller.fullname,
                    hintText: userController.user.value.fullname,
                    obscureText: false,
                    validator: (value) => Validations.validateEmptyText('Fullname', value),
                  ),

                  // const SizedBox(height: 10),
                  //
                  // TextFieldWidget(
                  //   controller: emailController,
                  //   hintText: userController.user.value.email,
                  //   obscureText: false,
                  //   validator: (value) => Validations.validateEmptyText('Email', value),
                  // ),

                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Cancel',
                        style: TextStyle(
                          color: textColor2,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      const SizedBox(width: 40),

                      // save button
                      Button(
                        onPressed: () => controller.updateUserName(),
                        text: 'Save'
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
