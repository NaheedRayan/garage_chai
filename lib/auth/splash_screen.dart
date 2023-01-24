import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garage_chai/auth/login.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  initState() {
    // print("initState ");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);


  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/splash_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(left: 35, right: 35),
          child: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 200,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: new DecorationImage(
                      image: new AssetImage("assets/garage_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 73,
                ),
                Text(
                  'Unlocking the door to',
                  style: TextStyle(
                      color: Color(0xff546238),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'hassle-free garage',
                  style: TextStyle(
                      color: Color(0xff546238),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'leasing and rental',
                  style: TextStyle(
                      color: Color(0xff546238),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 196,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Get Started'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xff546238),
                        // change background color of button
                        backgroundColor: Color(0xffD6F5A2),
                        // change text color of button
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
