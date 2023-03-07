import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notekeeper/api/helpers.dart';
import 'package:notekeeper/auth/forgot_password.dart';
import 'package:notekeeper/auth/sign_up.dart';
import 'package:notekeeper/notes/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/auth.dart';
import '../widgets/form_outline.dart';
import '../widgets/loading_dialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String email_address;
  late String? password;
  late bool show_password = false;
  late Object data = {};
  Helpers helpers = Helpers();
  late AuthRequest authRequest = AuthRequest();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  void initState(){

    setState(() {
      helpers.generateToken();

      if (helpers.userData != null){
        print('not empty ${helpers.userData}');
      }else{
        print('user empty');
      }
    });

  }

  logInFunction (data) async {
    // setState(() {
    //   showLoaderDialog(context);
    // });

    var res = await authRequest.login(data);

    var response = json.decode(res.body);

    print("login data ${response['msg']}");
    if(response['code'] == 200){
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('token', response['msg']['token']);
      localStorage.setString('name', response['msg']['user']['name']);
      localStorage.setString('email', response['msg']['user']['email']);
      localStorage.setInt('id', response['msg']['user']['id']);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

    }else{
      helpers.displayHttpMessage(context, "${response['msg']}", 402);
    }

  }


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
                        Form(
                          key: loginFormKey,
                          child: Column(
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
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Email Address required';
                                  }
                                  if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)){
                                    return 'Invalid Email Address';
                                  }

                                  email_address = value;
                                },
                              ),
                              const SizedBox(height: 40.0),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                obscureText: show_password ? false : true,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    hintText: 'Password',
                                    suffixIcon: GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          if(show_password){
                                            show_password = false;
                                          }else{
                                            show_password = true;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        show_password ? Icons.visibility : Icons.visibility_off_outlined,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontSize: 20.0),
                                    focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                    border: generateOutlineBorder(Theme.of(context).primaryColor)
                                ),
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Password is required';
                                  }

                                  password = value;
                                },
                              ),
                            ],
                          ),
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
                              if(loginFormKey.currentState!.validate()){
                                loginFormKey.currentState!.save();

                                data = {
                                  'email': email_address,
                                  'password': password,
                                };
                                logInFunction(data);

                              }
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Note()));
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
