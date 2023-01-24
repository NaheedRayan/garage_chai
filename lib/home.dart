import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_chai/auth/verify.dart';
import 'package:garage_chai/cardpage.dart';
import 'package:garage_chai/homepage.dart';
import 'package:garage_chai/settingspage.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}


class _homeState extends State<home> {



  int _selectedIndex = 0; //New
  static const List<Widget> _pages = <Widget>[
    homepage(),
    cardpage(),
    settingspage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff7DB588),
        elevation: 0,
        leading:   Padding(
          padding: const EdgeInsets.fromLTRB(15.0,8.0,0.0,8.0),
          child: Container(
            height: 2,
            width: 2,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: new DecorationImage(
                image: new AssetImage("assets/garage_logo_home_page.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Container(
          height: 40,
          width: 100,
          child: Center(child: Text("469 Tk")),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xff97C7A7),
          ),
        ),
        centerTitle: true,


        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 15.0, 8.0),
            child: Container(
              width: 50,
              child:  Icon(Icons.person),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xff97C7A7),
              ),
            ),
          ),

        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped, //New
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
