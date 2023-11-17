import 'package:aquafeed_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/features/welcome.dart';
import 'package:aquafeed_app/src/features/home/screens/tips/tips_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(scaffoldBackgroundColor: whiteColor, fontFamily: "Poppins"),
  initialRoute: '/tips',
  routes: {
    '/': (context) => const Welcome(),
    '/tips': (context) => const Tips(),
  },
));