import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:strix/ui/signin_ui.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(children: const [
          Image(
            image: AssetImage('images/icon.png'),
            height: 350,
            width: 150,
            fit: BoxFit.contain,
          ),
        ],),
        backgroundColor:Colors.white,
        nextScreen: const SigninUi(),
        splashTransition:SplashTransition.scaleTransition,
        duration: 150,
        splashIconSize: 380,
      
        pageTransitionType: PageTransitionType.fade);
  }
}
