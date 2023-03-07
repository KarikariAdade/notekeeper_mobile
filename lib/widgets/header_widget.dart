import 'package:flutter/material.dart';
import 'package:notekeeper/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/helpers.dart';
import 'header_buttons.dart';

class HeaderWidget extends StatefulWidget {

  final String pageName;

  const HeaderWidget(this.pageName);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  var userData = {};

  var token = '';

  Helpers helpers = Helpers();

  @override
  void initState() {
    validateLoggedInUser();

    // TODO: implement initState
    super.initState();


  }

  void validateLoggedInUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    helpers.token = localStorage.getString('token')!;
    print("THIS IS THE TOKEN before if ${helpers.token}");
    if(helpers.token != null){
      setState(() {
        userData = {
          'name': localStorage.getString('name'),
          'email': localStorage.getString('email'),
          'id': localStorage.getInt('id'),
        };
      });

      print('user data token >>>>> ${userData}');
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }


  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/img/header-bg.jpg',
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4.5,
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.4),
                      Colors.black.withOpacity(0.6),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 9.0),
            child: widget.pageName != 'favorites' ? HeaderButtons(widget.pageName): Container(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 90.0, 8.0, 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.pageName == 'notes' ? "Good Evening, ${userData['name']}" : '${widget.pageName.toUpperCase()}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'August 19, 2022',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}





