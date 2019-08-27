import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;
import './MyTabs.dart' as mytabs;
import 'dart:async';


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Future.delayed(
        Duration(seconds: 3),
        (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>mytabs.MyTabs()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: FlightImageAsset()
    );
  }
}

class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/festposter.jpg');
    Image image = Image(image: assetImage);
    return Container(child:image);
  }

}
