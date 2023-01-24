import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garage_chai/main.dart';
import 'package:garage_chai/renting_services/verification_apply_car.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  static String user_phone_number = "";

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                color: Color(0xff7DB588),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,50.0,20.0,50.0),
                  child: Row(
                    children: [
                      Text(
                        'Want to rent or\nlease a garage \nspace?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(width: 60,),
                      Container(
                        height: 100,
                        width: 150,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: new DecorationImage(
                            image: new AssetImage("assets/garage.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

               Padding(
                padding: const EdgeInsets.fromLTRB(20.0,8.0,20.0,8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Renting Service',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const verification_apply_car()),
                        );

                      },
                      child: new StreamBuilder(
                        stream: FirebaseFirestore.instance.collection("users").doc(MyApp.user_phone_number).snapshots(),
                        builder: (context ,snapshot){
                          if(snapshot.hasData){
                            var x = snapshot.data?.data();
                            // print(x['phoneNumber']);
                            Map<dynamic,dynamic> result = x as Map;
                            // print(result["phoneNumber"]);
                            return Container(
                              width: 140,
                              height: 180,
                              child: Card(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 140,
                                      height: 100,

                                      child: Center(
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: new DecorationImage(
                                              image: new AssetImage("assets/car.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      // leading: Icon(Icons.arrow_drop_down_circle),
                                      title: const Text('Park a Car',style: TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),),
                                      subtitle: Text(
                                        "${x!["card_car"]}",
                                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );}
                          else return Text("No data");
                        },
                      )
                    ),
                    InkWell(
                        onTap:(){

                        },
                        child: new StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("users").doc(MyApp.user_phone_number).snapshots(),
                          builder: (context ,snapshot){
                            if(snapshot.hasData){
                              var x = snapshot.data?.data();
                              // print(x['phoneNumber']);
                              Map<dynamic,dynamic> result = x as Map;
                              // print(result["phoneNumber"]);
                              return Container(
                                width: 140,
                                height: 180,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 140,
                                        height: 100,

                                        child: Center(
                                          child: Container(
                                            height: 55,
                                            width: 100,
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: new DecorationImage(
                                                image: new AssetImage("assets/bike.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        // leading: Icon(Icons.arrow_drop_down_circle),
                                        title: const Text('Park a Bike',style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                        subtitle: Text(
                                          "${x!["card_bike"]}",
                                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );}
                            else return Text("No data");
                          },
                        )
                    ),
                    InkWell(
                        onTap:(){

                        },
                        child: new StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("users").doc(MyApp.user_phone_number).snapshots(),
                          builder: (context ,snapshot){
                            if(snapshot.hasData){
                              var x = snapshot.data?.data();
                              // print(x['phoneNumber']);
                              Map<dynamic,dynamic> result = x as Map;
                              // print(result["phoneNumber"]);
                              return Container(
                                width: 140,
                                height: 180,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 140,
                                        height: 100,

                                        child: Center(
                                          child: Container(
                                            height: 60,
                                            width: 100,
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: new DecorationImage(
                                                image: new AssetImage("assets/cycle.png"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        // leading: Icon(Icons.arrow_drop_down_circle),
                                        title: const Text('Park a Cycle',style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                        subtitle: Text(
                                          "${x!["card_cycle"]}",
                                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );}
                            else return Text("No data");
                          },
                        )
                    ),
                    InkWell(
                        onTap:(){

                        },
                        child: new StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("users").doc(MyApp.user_phone_number).snapshots(),
                          builder: (context ,snapshot){
                            if(snapshot.hasData){
                              var x = snapshot.data?.data();
                              // print(x['phoneNumber']);
                              Map<dynamic,dynamic> result = x as Map;
                              // print(result["phoneNumber"]);
                              return Container(
                                width: 140,
                                height: 180,
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 140,
                                        height: 100,

                                        child: Center(
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: new DecorationImage(
                                                image: new AssetImage("assets/truckmini.jpeg"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ListTile(
                                        // leading: Icon(Icons.arrow_drop_down_circle),
                                        title: const Text('Park a mini Truck',style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                        subtitle: Text(
                                          "${x!["card_mini_truck"]}",
                                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );}
                            else return Text("No data");
                          },
                        )
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Leasing Service',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                  onTap:(){

                  },
                  child: new StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("users").doc(MyApp.user_phone_number).snapshots(),
                    builder: (context ,snapshot){
                      if(snapshot.hasData){
                        var x = snapshot.data?.data();
                        // print(x['phoneNumber']);
                        Map<dynamic,dynamic> result = x as Map;
                        // print(result["phoneNumber"]);
                        return Container(
                          width: 140,
                          height: 180,
                          child: Card(
                            child: Column(
                              children: [
                                Container(
                                  width: 140,
                                  height: 100,

                                  child: Center(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: new DecorationImage(
                                          image: new AssetImage("assets/garage.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  // leading: Icon(Icons.arrow_drop_down_circle),
                                  title: const Text('Lease Garage',style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
                                  subtitle: Text(
                                    "${x!["card_garage."]}",
                                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );}
                      else return Text("No data");
                    },
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
