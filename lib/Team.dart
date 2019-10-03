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
                  title: Text("Jashan Sanger"),
                  subtitle: Text("Events Head"),
                ),

                ListTile(
                  title: Text("Naveen Tosawara"),
                  subtitle: Text("Events Head"),
                ),

                ListTile(
                  title: Text("Abhishek Balhara"),
                  subtitle: Text("Hospitality Head"),
                ),
                
                ListTile(
                  title: Text("Divyanshu Bains"),
                  subtitle: Text("WebDev Head"),
                ),
                
                ListTile(
                  title: Text("Dilip Sharma"),
                  subtitle: Text("WebDev Head"),
                ),
                
                ListTile(
                  title: Text("Gaurav Ailaney"),
                  subtitle: Text("Finance Head"),
                ),
                
                ListTile(
                  title: Text("Anmol Rattan"),
                  subtitle: Text("Marketing Head"),
                ),
                
                ListTile(
                  title: Text("Gurnoor Singh"),
                  subtitle: Text("Marketing Head"),
                ),
                
                ListTile(
                  title: Text("Luvkesh Attri"),
                  subtitle: Text("Marketing Team"),
                ),
                
                ListTile(
                  title: Text("Piyush Chechi"),
                  subtitle: Text("Media Head"),
                ),
                
                ListTile(
                  title: Text("Sunil Meena"),
                  subtitle: Text("Publicity Head"),
                ),
                
                ListTile(
                  title: Text("Rishabh Mudgal"),
                  subtitle: Text("Content Head"),
                ),
                
                ListTile(
                  title: Text("Kshitiz Sharma"),
                  subtitle: Text("Content Head"),
                ),
                
                ListTile(
                  title: Text("Abhinav Khanna"),
                  subtitle: Text("AppDev Head"),
                ),
                
                ListTile(
                  title: Text("Yashvardhan Singh Solanki"),
                  subtitle: Text("Marketing Head"),
                ),
                
                ListTile(
                  title: Text("Harshit Malik"),
                  subtitle: Text("Publicity Head"),
                ),
                
                ListTile(
                  title: Text("Ashish Swami"),
                  subtitle: Text("Security Head"),
                ),
                
                ListTile(
                  title: Text("Mehul Kapadia"),
                  subtitle: Text("Security Head"),
                ),
                
                ListTile(
                  title: Text("Mayank Raj"),
                  subtitle: Text("Decoration Head"),
                ),
                

              ],
            );
          },
        )
    );
  }

}