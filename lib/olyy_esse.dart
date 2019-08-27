import 'package:flutter/material.dart';

class olyy_esse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlightImageAsset();
  }

}



class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/olyy_esse.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.cover,);
    return Container(child:image);
  }

}