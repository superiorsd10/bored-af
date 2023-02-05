import 'package:bored_af/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:page_transition/page_transition.dart';

import '../components/app_bar.dart';
import '../components/custom_button.dart';
import '../constants.dart';

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key, this.activity});

  final dynamic activity;

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    String link = widget.activity['link'];
    Map<String, dynamic> shareActivity = {
      'Activity': widget.activity['activity'],
      'Type': capitalize(widget.activity['type']),
      'Participants': widget.activity['participants'],
      'Link': link,
    };
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
                  height: height / 15,
                ),
                Container(
                  width: width / 1.2,
                  decoration: const BoxDecoration(
                    color: GlobalVariables.containerColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                    child: Column(
                      children: [
                        Text(
                          widget.activity['activity'],
                          style: const TextStyle(
                            fontFamily: 'SourceCodePro',
                            fontSize: 24,
                            color: GlobalVariables.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height / 15,
                        ),
                        Text(
                          capitalize(widget.activity['type']),
                          style: const TextStyle(
                            fontFamily: 'SourceCodePro',
                            fontSize: 20,
                            color: GlobalVariables.textColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: height / 20,
                        ),
                        Text(
                          "${widget.activity['participants']} Participants",
                          style: const TextStyle(
                            fontFamily: 'SourceCodePro',
                            fontSize: 20,
                            color: GlobalVariables.textColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          height: height / 15,
                        ),
                        Visibility(
                          visible: link.isNotEmpty,
                          child: GestureDetector(
                            onTap: () {
                              if (link.isNotEmpty) {
                                _launchUrl(Uri.parse(link));
                              }
                            },
                            child: Text(
                              link,
                              style: const TextStyle(
                                fontFamily: 'SourceCodePro',
                                fontSize: 20,
                                color: GlobalVariables.textColor,
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height / 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await Share.share(json.encode(shareActivity));
                              },
                              child: Image.asset(
                                'assets/share-logo.png',
                                height: 32,
                                width: 32,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                CustomButton(
                  text: 'Still Bored AF?',
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
        ),
      ),
    );
  }
}
