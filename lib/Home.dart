import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálcular o IMC"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Color(0xff591212),
      ),
    );
  }
}
