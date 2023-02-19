import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notekeeper/notes/favourite.dart';
import 'package:notekeeper/widgets/categories_widgets.dart';

import 'notes_widgets.dart';

class HeaderButtons extends StatefulWidget {

  const HeaderButtons(this.pageName);

  final String pageName;



  @override
  State<HeaderButtons> createState() => _HeaderButtonsState();
}

class _HeaderButtonsState extends State<HeaderButtons> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: (){
            showMaterialModalBottomSheet(
                elevation: 20.0,
                isDismissible: false,
                context: context,
                builder: (context) => widget.pageName == 'notes' ? NotesCreateWidget() : CategoriesCreateWidget(),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
            ),
            child: Icon(Icons.add_circle_outline_outlined, color: Theme.of(context).primaryColor,),
          ),
        ),
        SizedBox(width: 10.0),
        // GestureDetector(
        //   onTap: (){
        //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Favorites()));
        //   },
        //   child: Container(
        //     padding: EdgeInsets.all(8.0),
        //     decoration: BoxDecoration(
        //         color: Theme.of(context).primaryColor,
        //         borderRadius: BorderRadius.circular(30.0),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.black,
        //             spreadRadius: 5,
        //             blurRadius: 7,
        //             offset: Offset(0, 3), // changes position of shadow
        //           ),
        //         ]
        //     ),
        //     child: Icon(Icons.favorite_border, color: Colors.white,),
        //   ),
        // ),
      ],
    );
  }
}

