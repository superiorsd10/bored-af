import 'package:bored_af/constants.dart';
import 'package:bored_af/screens/activity_screen.dart';
import 'package:bored_af/screens/participant_screen.dart';
import 'package:bored_af/screens/type_screen.dart';
import 'package:bored_af/services/api_services.dart';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../components/app_bar.dart';
import '../components/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  height: height / 4.5,
                ),
                const Text(
                  'Get an activity',
                  style: TextStyle(
                    color: GlobalVariables.textColor,
                    fontSize: 24,
                    fontFamily: 'SourceCodePro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: height / 20,
                ),
                CustomButton(
                  text: 'Random Activity',
                  height: height / 14,
                  width: width / 1.2,
                  onPressed: () async {
                    var activity = await APIServices.sendRequest('/', context);
                    print(activity);
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ActivityScreen(activity: activity),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 20,
                ),
                CustomButton(
                  text: 'By types',
                  height: height / 14,
                  width: width / 1.2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const TypeScreen(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 20,
                ),
                CustomButton(
                  text: 'By no. of participants',
                  height: height / 14,
                  width: width / 1.2,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const ParticipantScreen(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 5,
                ),
                const Text(
                  'Made by Sachin Dapkara',
                  style: TextStyle(
                    color: GlobalVariables.textColor,
                    fontSize: 16,
                    fontFamily: 'SourceCodePro',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
