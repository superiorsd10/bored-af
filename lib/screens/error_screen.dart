import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../components/app_bar.dart';
import '../components/custom_button.dart';
import '../constants.dart';
import 'home_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height / 3,
              ),
              const Text(
                'Not Found!',
                style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: GlobalVariables.containerColor,
                ),
              ),
              SizedBox(
                height: height / 14,
              ),
              CustomButton(
                text: 'Return to Home',
                height: height / 20,
                width: width / 1.6,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      child: const HomeScreen(),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
