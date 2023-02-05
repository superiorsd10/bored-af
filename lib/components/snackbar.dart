import 'package:bored_af/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar({required String message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: GlobalVariables.textColor,
          fontFamily: 'SourceCodePro',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: GlobalVariables.containerColor,
    ),
  );
}
