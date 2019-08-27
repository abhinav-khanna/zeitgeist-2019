import 'package:flutter/material.dart';
import 'package:zeitgeist/olyy_esse.dart' as olyy_esse;
class StarNight extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        children: <Widget>[
          olyy_esse.olyy_esse(),
        ],
      )
    );
  }

}