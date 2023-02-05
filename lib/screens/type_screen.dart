
import 'package:bored_af/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../components/app_bar.dart';
import '../components/custom_button.dart';
import '../services/api_services.dart';
import 'activity_screen.dart';

String lowercase(String s) => s[0].toLowerCase() + s.substring(1);

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  static const List<String> types = [
    'Education',
    'Recreational',
    'Social',
    'DIY',
    'Charity',
    'Cooking',
    'Relaxation',
    'Music',
    'Busywork',
  ];

  String selectedType = types.first;

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
                  'Select a type',
                  style: TextStyle(
                    color: GlobalVariables.textColor,
                    fontSize: 24,
                    fontFamily: 'SourceCodePro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 10),
                  child: DropdownButtonFormField(
                    value: selectedType,
                    elevation: 0,
                    icon: const Icon(Icons.arrow_downward_sharp),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    style: const TextStyle(
                      color: GlobalVariables.containerColor,
                      fontFamily: 'SourceCodePro',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: GlobalVariables.textColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: GlobalVariables.textColor,
                        ),
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    items: types.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedType = value!;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: height / 12,
                ),
                CustomButton(
                  text: 'Get an activity',
                  height: height / 20,
                  width: width / 1.6,
                  onPressed: () async {
                    var activity = await APIServices.sendRequest('?type=${lowercase(selectedType)}', context);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
