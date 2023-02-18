import 'package:flutter/material.dart';
import 'package:notekeeper/auth/login.dart';

import '../widgets/form_outline.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/img/header-bg.jpg', fit: BoxFit.cover,),
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
                            SizedBox(width: 40.0),
                            Text(
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: 34.0,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80.0,),
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
                          ],
                        ),
                        const SizedBox(height: 30.0,),
                        Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            child: Text('Login Here',
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
                            onTap: (){},
                            child: Center(
                              child: Text(
                                'Reset Password',
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
