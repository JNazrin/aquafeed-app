import 'package:aquafeed_app/src/bindings/general_bindings.dart';
import 'package:aquafeed_app/src/features/core/welcome.dart';
import 'package:flutter/material.dart';
import 'package:aquafeed_app/src/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aquafeed_app/firebase_options.dart';
import 'package:aquafeed_app/src/data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: whiteColor, fontFamily: "Poppins"),
      initialBinding: GeneralBindings(),
      home: const Welcome(),
    );
  }
}