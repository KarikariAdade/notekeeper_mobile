import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {

  final String pageName;

  const HeaderWidget(this.pageName);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {


  @override
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){},
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
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
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
                    child: Icon(Icons.favorite_border, color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 90.0, 8.0, 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Good Evening, Karikari, ${widget.pageName}',
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
