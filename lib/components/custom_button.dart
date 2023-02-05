import 'package:bored_af/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: GlobalVariables.containerColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: GlobalVariables.textColor,
              fontSize: 20,
              fontFamily: 'SourceCodePro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
