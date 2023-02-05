import 'dart:convert';

import 'package:bored_af/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static String baseUrl = "http://www.boredapi.com/api/activity";

  static Map<String, String> header = {
    "Content-Type": "application/json",
  };

  static sendRequest(String? endpoint, BuildContext context) async {
    try{
      print(Uri.parse("$baseUrl$endpoint"));
      var response = await http.get(Uri.parse("$baseUrl$endpoint"));
      var responseBody = jsonDecode(response.body);

      // print(responseBody);

      return responseBody;
    } catch(e){
      showSnackBar(message: e.toString(), context: context);
    }
  }
}
