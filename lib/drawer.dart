import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'About.dart';
import 'Team.dart';

class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
            child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                        padding: EdgeInsets.all(0),
                        child: Container(child: Image.asset('Images/drawerposter.jpg', fit: BoxFit.fill,),)
                    ),
                    Container(
                      //margin: EdgeInsets.only(top: 50),
                      color: Colors.white,
                      child:ListTile(
                        title: Text('Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        leading: Icon(Icons.add),
                        onTap: (){
                          launch("https://www.zeitgeist.org.in/events/");
                        },
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Campus Ambassador',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        leading: Icon(Icons.work),
                        onTap: (){
                          launch("https://www.zeitgeist.org.in/campus_ambassador/");
                        },
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Sponsors',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        leading: Icon(Icons.attach_money),
                        onTap: (){
                          launch("https://www.zeitgeist.org.in/");
                        },
                      ),
                    ),
                    Container(
                      child:ListTile(
                        title: Text('About us',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        leading: Icon(Icons.info),
                        onTap: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>About("About us")));
                        },

                      ),
                    ),


                    ListTile(
                      title: Text('Team',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      leading: Icon(Icons.group),
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>CoreTeam("CoreTeam")));
                      },
                    ),



                    ListTile(
                      title: Text("Phone: +91 842 7012 721"),
                      leading: Icon(Icons.phone),

                    ),

                    ListTile(
                      title: Text("zeitgeist.pr@iitrpr.ac.in"),
                      leading: Icon(Icons.email),

                    ),

                    ListTile(
                      title: Text("Indian Institute of Technology Ropar"),
                      subtitle: Text('Rupnagar, Punjab, India'),
                      leading: Icon(Icons.location_on),

                    ),
                  ],
                )
            )

        );
  }
}