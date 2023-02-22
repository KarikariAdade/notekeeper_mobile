import 'package:flutter/material.dart';
import 'package:notekeeper/auth/forgot_password.dart';
import 'package:notekeeper/auth/sign_up.dart';
import 'package:notekeeper/notes/index.dart';

import '../widgets/form_outline.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String email_address;
  late String password;
  GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/img/header-bg.jpg'),
              ),
              Container(
                  transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4, // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child:
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children:  [
                            Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.w900,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                        const SizedBox(height: 50.0),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                  border: generateOutlineBorder(Theme.of(context).primaryColor)
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                  border: generateOutlineBorder(Theme.of(context).primaryColor)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                              },
                              child: Text('Forgot Password',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                              },
                              child: Text('I am new here.',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ]
                          ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Note()));
                            },
                            child: Center(
                              child: Text(
                                'Log In',
                                style: TextStyle(color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )

            ],
          ),
        )
    );
  }
}
