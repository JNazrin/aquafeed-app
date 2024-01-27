import 'package:aquafeed_app/src/features/core/controllers/user_controller.dart';
import 'package:aquafeed_app/src/features/home/pages/home_screen.dart';
import 'package:aquafeed_app/src/utils/components/button_widget.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:aquafeed_app/src/features/profile/pages/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/components/profile_details_widget.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    final userController = UserController.instance;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: primaryColor,
          onPressed: () {
            // Navigate to the desired page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
          },
        ),
        backgroundColor: whiteColor,
        elevation: 0,
      ),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: Column(
            children: [
              // profile image
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: const Image(
                            image: AssetImage('assets/avatar.png')
                          ),
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
                  )
                ],
              ),

              Text(
                userController.user.value.fullname,
                style: const TextStyle(
                  fontSize: 17,
                  color: primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),

              Text(
                userController.user.value.email,
                style: const TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 40),

              // profile details
              ProfileDetails(
                title: 'Name',
                subtitle: userController.user.value.fullname,
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              ProfileDetails(
                title: 'Email',
                subtitle: userController.user.value.email,
              ),

              const SizedBox(height: 40),

              // edit profile button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Logout button
                  InkWell(
                    onTap: () => AuthenticationRepository.instance.logout(),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                      ),
                    ),
                  ),

                  const SizedBox(width: 40),

                  Button(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                    }, 
                    text: 'Edit'
                  ),
                  // const SizedBox(width: 5),
                  // Button(
                  //     onPressed: () => AuthenticationRepository.instance.logout(),
                  //     text: 'Logout'
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}