
import 'package:bored_af/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import '../components/app_bar.dart';
import '../components/custom_button.dart';
import '../components/snackbar.dart';
import '../services/api_services.dart';
import 'activity_screen.dart';

String lowercase(String s) => s[0].toLowerCase() + s.substring(1);

class ParticipantScreen extends StatefulWidget {
  const ParticipantScreen({super.key});

  @override
  State<ParticipantScreen> createState() => _ParticipantScreenState();
}

class _ParticipantScreenState extends State<ParticipantScreen> {
  final _formKey = GlobalKey<FormState>();
  final _participantsController = TextEditingController();
  int participants = 1;

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
                  height: height / 4,
                ),
                const Text(
                  'Enter no. of participants',
                  style: TextStyle(
                    color: GlobalVariables.textColor,
                    fontSize: 20,
                    fontFamily: 'SourceCodePro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: width / 1.25,
                        height: height / 13,
                        decoration: const BoxDecoration(
                          color: GlobalVariables.textColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 10),
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: _participantsController,
                            onChanged: ((value) {
                              participants = int.parse(value);
                            }),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter...',
                              hintStyle: TextStyle(
                                fontSize: 24,
                                fontFamily: 'SourceCodePro',
                                color: GlobalVariables.containerColor
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                showSnackBar(message: 'Enter no. of participants', context: context);
                              }
                              return null;
                            },
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'SourceCodePro',
                              color: GlobalVariables.containerColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 12,
                      ),
                      CustomButton(
                        text: 'Get an activity',
                        height: height / 20,
                        width: width / 1.6,
                        onPressed: () async{
                          if (_formKey.currentState!.validate()) {
                            var activity = await APIServices.sendRequest('?participants=${lowercase(participants.toString())}', context);
                            print(activity);
                            Navigator.push(
                              context,
                              PageTransition(
                                child: ActivityScreen(activity: activity),
                                type: PageTransitionType.fade,
                              ),
                            );
                          }
                        },
                      ),
                    ],
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
