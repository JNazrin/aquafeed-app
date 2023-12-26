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
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
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

              const Text(
                'Johan Nazrin',
                style: TextStyle(
                  fontSize: 17,
                  color: primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),

              const Text(
                'johannazrin310@gmail.com',
                style: TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 40),

              // profile details
              const ProfileDetails(
                title: 'Name',
                subtitle: 'Johan Nazrin',
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              const ProfileDetails(
                title: 'Email',
                subtitle: 'johannazrin310@gmail.com',
              ),
              const Divider(
                height: 10,
                thickness: 1,
              ),
              const ProfileDetails(
                title: 'Phone',
                subtitle: '017-3857225',
              ),

              const SizedBox(height: 40),

              // edit profile button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Button(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                    }, 
                    text: 'Edit'
                  ),
                  const SizedBox(width: 5),
                  Button(
                      onPressed: () => AuthenticationRepository.instance.logout(),
                      text: 'Logout'
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}