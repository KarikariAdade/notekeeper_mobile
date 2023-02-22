import 'package:flutter/material.dart';
import 'package:notekeeper/api/auth.dart';
import 'package:notekeeper/auth/login.dart';

import '../api/auth.dart';
import '../widgets/form_outline.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String full_name;
  late String email_address;
  late String password;
  late String password_confirmation;

  late bool show_password = false;

  late Object data = [];

  late AuthRequest authRequest = new AuthRequest();

  var formKey = GlobalKey<FormState>();

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
                      blurRadius: 4,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
              ),
              width: MediaQuery.of(context).size.width,
              child:
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap:() => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: 90.0),
                          Text(
                              'Sign Up',
                            style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0,),
                      Form(
                        key: formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Full Name is Required';
                                }
                                full_name = value;
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                    Icons.account_circle_outlined,
                                    color: Theme.of(context).primaryColor,
                                ),
                                hintText: 'Full Name',
                                hintStyle: TextStyle(fontSize: 20.0),
                                focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                border: generateOutlineBorder(Theme.of(context).primaryColor)
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
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
                            const SizedBox(height: 20.0),
                            TextFormField(
                              obscureText: show_password ? false : true,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Password field is required';
                                }

                                if(value.length < 8){
                                  return 'Password should be more than 8 characters';
                                }

                                password = value;

                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).primaryColor,
                                ),
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
                                hintText: 'Password',
                                hintStyle: TextStyle(fontSize: 20.0),
                                focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                  border: generateOutlineBorder(Theme.of(context).primaryColor)
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: show_password ? false : true,
                              validator: (value) {
                                if(value == null || value.isEmpty){
                                  return 'Confirm Password field is required';
                                }

                                if(password != value){
                                  return 'Passwords do not match';
                                }

                                password_confirmation = value;

                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock_open,
                                    color: Theme.of(context).primaryColor,
                                  ),
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
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(fontSize: 20.0),
                                  focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                                  border: generateOutlineBorder(Theme.of(context).primaryColor)
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0,),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text('I already have an account',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold
                            )
                          ),
                        ),
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
                            if(formKey.currentState!.validate()){
                              formKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.blue,
                                    content: Text(
                                      "Incorrect phone number or password",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    duration: Duration(seconds: 4),
                              ));
                              data = {
                                "full_name": full_name,
                                "email": email_address,
                                "password": password,
                                "password_confirmation": password_confirmation
                              };

                              authRequest.signUp(data);

                            }
                          },
                          child: Center(
                            child: Text(
                                'Sign Up',
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

