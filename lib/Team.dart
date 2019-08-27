import 'package:flutter/material.dart';

class CoreTeam extends StatelessWidget{

  final String title;

  CoreTeam(this.title);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title:Text("Zeitgeist 2019 core team")
        ),

        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text("Hardik Goyal"),
                  subtitle: Text("Overall Coordinator"),
                ),

                ListTile(
                  title: Text("Abhishek"),
                  subtitle: Text("Hospitality Head"),
                ),

                ListTile(
                  title: Text("Gurnoor"),
                  subtitle: Text("Marketing Head"),
                ),

                ListTile(
                  title: Text("Rishabh"),
                  subtitle: Text("Content Head"),
                ),

                ListTile(
                  title: Text("Divyanshu"),
                  subtitle: Text("WebDev Head"),
                ),

                ListTile(
                  title: Text("Dilip"),
                  subtitle: Text("WebDev Head"),
                ),

                ListTile(
                  title: Text("Abhinav Khanna"),
                  subtitle: Text("Appdev Head"),
                ),

                ListTile(
                  title: Text("Gaurav"),
                  subtitle: Text("Finance Head"),
                ),

                ListTile(
                  title: Text("Ksithiz"),
                  subtitle: Text("Content Head"),
                ),

                ListTile(
                  title: Text("Jashan"),
                  subtitle: Text("Event Head"),
                ),

                ListTile(
                  title: Text("Naveen"),
                  subtitle: Text("Event Head"),
                ),

                ListTile(
                  title: Text("Lukesh"),
                  subtitle: Text("Marketing Head"),
                ),

                ListTile(
                  title: Text("Piyush"),
                  subtitle: Text("Publicity Head"),
                ),

                ListTile(
                  title: Text("Sunil"),
                  subtitle: Text("PR Head"),
                ),

              ],
            );
          },
        )
    );
  }

}