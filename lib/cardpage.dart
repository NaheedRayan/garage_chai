import 'package:flutter/material.dart';

class cardpage extends StatefulWidget {
  const cardpage({Key? key}) : super(key: key);

  @override
  State<cardpage> createState() => _cardpageState();
}

class _cardpageState extends State<cardpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is card page"),
      ),
    );
  }
}
