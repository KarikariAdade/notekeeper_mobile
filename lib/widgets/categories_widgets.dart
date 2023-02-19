import 'package:flutter/material.dart';

import 'form_outline.dart';
class CategoriesCreateWidget extends StatefulWidget {
  const CategoriesCreateWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesCreateWidget> createState() => _CategoriesCreateWidgetState();
}

class _CategoriesCreateWidgetState extends State<CategoriesCreateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 550.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 20.0,),
                Text(
                  'Create Category',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2.0)
                    ),
                    child: Icon(Icons.close_rounded, color: Theme.of(context).primaryColor,),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.text_fields,
                    color: Theme.of(context).primaryColor,
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(fontSize: 20.0),
                  focusedBorder: generateOutlineBorder(Theme.of(context).primaryColor),
                  border: generateOutlineBorder(Theme.of(context).primaryColor)
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                ),
                child: Center(
                  child: Text(
                    'Create Category',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
