import 'package:flutter/material.dart';

class verification_apply_car extends StatefulWidget {
  const verification_apply_car({Key? key}) : super(key: key);

  @override
  State<verification_apply_car> createState() => _verification_apply_carState();
}

class _verification_apply_carState extends State<verification_apply_car> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 8.0),
          child: Column(
            children: [
              Text(
                "Extra Verification",
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff546238),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "You have to submit these documents to",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "use the service",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50,),


            ],
          ),
        ),
      ),
    );
  }
}
