import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget('categories'),
            SizedBox(height: 20.0),
          ],
        )
    );
  }
}
