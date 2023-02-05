import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bored_af/constants.dart';
import 'package:bored_af/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bored AF?',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: AnimatedSplashScreen(
          splash: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Bored AF?',
                textStyle: const TextStyle(
                  color: GlobalVariables.textColor,
                  fontSize: 36,
                  fontFamily: 'SourceCodePro',
                  fontWeight: FontWeight.w900,
                ),
                speed: const Duration(milliseconds: 200),
                cursor: '_',
              ),
            ],
          ),
          nextScreen: HomeScreen(),
          centered: true,
          backgroundColor: GlobalVariables.backgroundColor,
          duration: 1500,
          pageTransitionType: PageTransitionType.fade,
        ),
      ),
    );
  }
}
