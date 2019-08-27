import 'package:flutter/material.dart';
import 'package:zeitgeist/olyy_esse.dart' as olyy_esse;
class StarNight extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(20, 24, 82, 1),
            title: Text('Previously on Zeitgeist Pro-Nights'),
          ),
            body: ListView(
              children: <Widget>[
                OlyyEsse(),
                RanjitBawa(),
                Vishal(),
                Shekhar()
              ],
            )
        )
    );
  }

}

class PreviousEdition extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromRGBO(255,118,25, 0.88),
      child: Center(
        child:
          Text("Our lineup for the previous editions of Pro-Nights include",
          style: TextStyle(
            fontSize: 25
          ),)
      ),
    );
  }

}

class OlyyEsse extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/olyy_esse.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.cover,);
    return Container(child:image);
  }

}

class RanjitBawa extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/ranjit_bawa.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.cover,);
    return Container(child:image);
  }

}

class Vishal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/vishal.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.cover,);
    return Container(child:image);
  }

}

class Shekhar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/shekhar.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.cover,);
    return Container(child:image);
  }

}