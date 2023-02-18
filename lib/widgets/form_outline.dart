import 'package:flutter/material.dart';

OutlineInputBorder generateOutlineBorder(color){
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(
        color: color,
        // style: BorderStyle.none,
        width: 2.0
    ),
  );
}
