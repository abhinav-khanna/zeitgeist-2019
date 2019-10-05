import 'package:flutter/material.dart';

class StarNight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black87,
            body: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Previously on Zeitgeist Pro-Nights',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                OlyyEsse(),
                RanjitBawa(),
                Vishal(),
                Shekhar()
              ],
            )));
  }
}

class PreviousEdition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color.fromRGBO(255, 118, 25, 0.88),
      child: Center(
          child: Text(
        "Our lineup for the previous editions of Pro-Nights include",
        style: TextStyle(fontSize: 25),
      )),
    );
  }
}

class OlyyEsse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/olyy_esse.jpg');
    Image image = Image(
      image: assetImage,
      fit: BoxFit.cover,
    );
    return Container(child: image);
  }
}

class RanjitBawa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/ranjit_bawa.jpg');
    Image image = Image(
      image: assetImage,
      fit: BoxFit.cover,
    );
    return Container(child: image);
  }
}

class Vishal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/vishal.jpg');
    Image image = Image(
      image: assetImage,
      fit: BoxFit.cover,
    );
    return Container(child: image);
  }
}

class Shekhar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/shekhar.jpg');
    Image image = Image(
      image: assetImage,
      fit: BoxFit.cover,
    );
    return Container(child: image);
  }
}
