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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index){
                    return Column(
                      children: [
                        Card(
                          elevation: 4,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 300.0,
                                  child: Text(
                                    'Hello asdfasdfworld',
                                    style: TextStyle(
                                        fontSize: 18.0
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            border: Border.all(color: Theme.of(context).primaryColor, width: 2.0)
                                        ),
                                        child: Icon(
                                          Icons.edit_note_outlined,
                                          color: Theme.of(context).primaryColor,
                                          size: 20.0,
                                        )
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            border: Border.all(color: Colors.red, width: 2.0)
                                        ),
                                        child: Icon(
                                          Icons.delete_outline_outlined,
                                          color: Colors.red,
                                          size: 20.0,
                                        )
                                    ),
                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }
              ),
            ),
            // SingleChildScrollView(
            //   child: Column(
            //     children: [
            //       Card(
            //         elevation: 4,
            //         child: Container(
            //           padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Container(
            //                 width: 300.0,
            //                 child: Text(
            //                     'Hello asdfasdfworld',
            //                   style: TextStyle(
            //                     fontSize: 18.0
            //                   ),
            //                 ),
            //               ),
            //               Row(
            //                 children: [
            //                   Container(
            //                       padding: EdgeInsets.all(3.0),
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(20.0),
            //                           border: Border.all(color: Theme.of(context).primaryColor, width: 2.0)
            //                       ),
            //                       child: Icon(
            //                         Icons.edit_note_outlined,
            //                         color: Theme.of(context).primaryColor,
            //                         size: 20.0,
            //                       )
            //                   ),
            //                   SizedBox(width: 10.0),
            //                   Container(
            //                       padding: EdgeInsets.all(3.0),
            //                       decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(20.0),
            //                           border: Border.all(color: Colors.red, width: 2.0)
            //                       ),
            //                       child: Icon(
            //                         Icons.delete_outline_outlined,
            //                         color: Colors.red,
            //                         size: 20.0,
            //                       )
            //                   ),
            //                 ],
            //               )
            //
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   )
            // )
          ],
        )
    );
  }
}
