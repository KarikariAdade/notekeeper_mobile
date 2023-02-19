import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: <Widget>[
            HeaderWidget('favorites'),
            SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4,
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
            ),
            SizedBox(height: 20.0)
          ],
        )
    );
  }
}
