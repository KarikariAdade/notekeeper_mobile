import 'package:flutter/material.dart';

import '../widgets/header_buttons.dart';

class NoteDetails extends StatefulWidget {

  int index;

  NoteDetails(this.index);

  late String pageName = 'Hello';

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                child: HeaderButtons(widget.pageName)
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 90.0, 8.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.pageName == 'notes' ? 'Good Evening, Karikari' : '${widget.pageName.toUpperCase()}',
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
            ]),
      ),
    );
  }
}
