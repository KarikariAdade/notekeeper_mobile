import 'package:flutter/material.dart';
import 'package:notekeeper/notes/details.dart';

import '../widgets/header_widget.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Column(
        children: <Widget>[
          HeaderWidget('notes'),
          SizedBox(height: 20.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 13.0,
                    mainAxisSpacing: 20.0
                ),
                itemBuilder: (BuildContext context, int index){
                  return SizedBox(
                    height: double.infinity,
                    child: Card(
                      elevation: 5.0,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NoteDetails(index)));
                                print('hello world $index');
                              });
                            },
                            child: ListTile(
                              subtitle: Text(
                                  'Music by Julie Gable. Lyrics by Sidney Stein.',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                  // return Image.network(images[index]);
                },
              ),
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }
}
