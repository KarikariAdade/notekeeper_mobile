import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:notekeeper/api/helpers.dart';
import 'package:notekeeper/auth/login.dart';
import 'package:notekeeper/notes/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Helpers helpers = Helpers();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: CircleAvatar(
        child: Image.asset(
            'assets/img/header-bg.jpg',
          width: 100.0,
          height: 100.0,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      screenFunction: () async{

        SharedPreferences localStorage = await SharedPreferences.getInstance();

        helpers.token = localStorage.getString('token')!;

        if (helpers.token != null){
          return HomePage();
        }else{
          return Login();
        }

      },
      splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }

}

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

