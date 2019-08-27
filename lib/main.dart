import 'package:flutter/material.dart';
import './MyTabs.dart' as mytabs;
import 'dart:async';


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: mytabs.MyTabs()
    );
  }

}
