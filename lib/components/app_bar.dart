import 'package:bored_af/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Bored AF?',
        style: TextStyle(
          fontFamily: 'SourceCodePro',
          fontSize: 28,
          color: GlobalVariables.textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      backgroundColor: GlobalVariables.containerColor,
      elevation: 0,
    );
  }
}
