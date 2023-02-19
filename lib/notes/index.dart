import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:notekeeper/categories/index.dart';
import 'package:notekeeper/widgets/header_widget.dart';

import 'favourite.dart';
import 'note_page.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {

  int currentTabIndex = 0;

  late List<Widget> pages;

  late Widget currentPage;

  late NotePage notesPage;
  late Favorites favoritesPage;
  late Categories categoriesPage;

  @override
  void initState() {

    notesPage = NotePage();

    favoritesPage = Favorites();

    categoriesPage = Categories();

    pages = [notesPage, favoritesPage, categoriesPage];

    currentPage = notesPage;

    super.initState();
  }

  @override
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
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
            currentTabIndex = index;
            currentPage = pages[index];
            print('$index');
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}


