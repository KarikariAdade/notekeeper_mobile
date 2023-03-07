import 'package:flutter/material.dart';


showLoaderDialog(BuildContext context){
  AlertDialog alert=AlertDialog(
    shape: RoundedRectangleBorder(
  side:new  BorderSide(color: Color(0xFF2A8068)),
  borderRadius: new BorderRadius.all(new Radius.circular(30))),

    content: Row(
      children: [
        CircularProgressIndicator(),
        SizedBox(width: 20.0,),
        Container(
            margin: EdgeInsets.only(left: 7),
            child:Text("Loading..." )
        ),
      ],),
  );
  showDialog(barrierDismissible: false,
    context:context,
    builder:(BuildContext context){
      return alert;
    },
  );
}