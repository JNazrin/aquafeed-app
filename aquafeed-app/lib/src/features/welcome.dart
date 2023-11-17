import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'authentication/login/login.dart';
import 'package:aquafeed_app/src/constants/colors.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Discover the Future of Aquaculture',
          body: 'At AquaFeed, we are dedicated to revolutionizing the way you manage aquaculture feeding.',
          image: buildImage('assets/welcome.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Optimizing Aquaculture Excellence with AquaFeed',
          body: 'AquaFeed offers a comprehensive solution for aquaculturists, combining advanced scheduling tools, real-time pH monitoring, expert tips, and ensuring healthier and more productive aquaculture practices.',
          image: buildImage('assets/welcome2.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Why Choose AquaFeed?',
          body: 'Elevate your aquaculture with AquaFeed. Effortlessly schedule feedings, monitor water pH in real-time, and gain new knowledge about aquaculture. Maximize fish health and growth with AquaFeed\'s user-friendly features.',
          image: buildImage('assets/welcome3.png'),
          decoration: getPageDecoration(),
        ),
      ],

      showSkipButton: true,
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),

      showNextButton: true,
      next: const Text('Next', style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor)),

      showBackButton: false,

      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor)),

      onDone: () => goLogin(context),
      onSkip: () => goLogin(context),

      dotsDecorator: getDotDecoration(),
    )
  );

  Widget buildImage(String path) => Center(
    child: Image.asset(path, width: 380),
  );

  PageDecoration getPageDecoration() => const PageDecoration(
    titleTextStyle: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: primaryColor),
    bodyTextStyle: TextStyle(fontSize: 15, color: textColor2),
    imagePadding: EdgeInsets.all(24),
    bodyPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
  );

  void goLogin(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => Login()),
  );

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: const Color(0xFFC3C3C3), // Inactive color
    activeColor: primaryColor,
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}