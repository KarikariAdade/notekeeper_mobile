import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Helpers {

  String url = 'http://10.0.2.2:8000/api';

  var token = '';

  var userData = {};

  bool is_authenticated = false;

  postRequest(request_url, data) async {
    print('url $url/$request_url');

    return await http.post(Uri.parse("$url/$request_url"),
        body: jsonEncode(data), headers: await generateHeaders());
  }

  getRequest(request_url) async {
    return await http.get(
        Uri.parse("$url/$request_url"), headers: await generateHeaders());
  }

  displayHttpMessage(BuildContext context, message, status) {
    return ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          backgroundColor: status == 200 ? Colors.green : Colors.red,
          duration: const Duration(seconds: 5),
          content: Text('$message'),
        )
    );
  }

  generateToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString("token")!;

    userData = {
      'name': localStorage.getInt('id'),
      'email': localStorage.getString('email'),
      'id': localStorage.getString('name'),
    };

    print("GENERATED TOKEN FROM HELPERS: $token");
  }

  generateHeaders() async {

    await generateToken();

    print("THI SI  THE GEN TOKEN $token");

    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

}