import 'package:flutter/material.dart';
import 'package:notekeeper/auth/login.dart';

import 'auth/sign_up.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: const Color(0xff162671)
    ),
    home: SafeArea(
    child: Login(),
  )
));