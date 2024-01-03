import 'package:aquafeed_app/src/features/profile/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/textfield_widget.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/validators/validation.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.arrow_back_ios),
        //   color: primaryColor,
        // ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: textColor,
          ),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
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
        
                const SizedBox(height: 40),
        
                // profile details
                TextFieldWidget(
                  controller: nameController,
                  hintText: 'Johan Nazrin',
                  obscureText: false,
                  validator: (value) => Validations.validateEmptyText('Fullname', value),
                ),
        
                const SizedBox(height: 10),
        
                TextFieldWidget(
                  controller: emailController,
                  hintText: 'johannazrin310@gmail.com',
                  obscureText: false,
                  validator: (value) => Validations.validateEmptyText('Email', value),
                ),
        
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Profile()));
                      }, 
                      text: 'Save'
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
