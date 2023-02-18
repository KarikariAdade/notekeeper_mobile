import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notekeeper/widgets/header_widget.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  @override
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: <Widget>[
            HeaderWidget('notes'),
            SizedBox(height: 20.0),
            Expanded(
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
            SizedBox(height: 20.0)
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.favorite_border_outlined, size: 30, color: Colors.white,),
          Icon(Icons.category, size: 30, color: Colors.white,),
        ],
        color: Theme.of(context).primaryColor,
        buttonBackgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {

            print('$index');
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

Future createNotePad (context) {
  return showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Text('Hellow World'),
      )
  );
}

// showModalBottomSheet<void>(
// context: context,
// builder: (BuildContext context) {
// return Container(
// height: 500,
// color: Colors.amber,
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// const Text('Modal BottomSheet'),
// ElevatedButton(
// child: const Text('Close BottomSheet'),
// onPressed: () => Navigator.pop(context),
// ),
// ],
// ),
// ),
// );
// },
// );