import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zeitgeist/StarNight.dart';
import 'package:zeitgeist/notificationpage.dart';
import './MyTabs.dart' as mytabs;
import 'package:http/http.dart' as http;
import 'dart:convert';
import './About.dart' as about;
import './Team.dart' as team;
import 'package:url_launcher/url_launcher.dart';
import 'firebasenotifications.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/notipage": (BuildContext context) => NotificationPage(),
      }));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _home, _shedule, _pronight;
  static const platform = const MethodChannel('com.softcom.zeitgeist/map_view');

  _buildschedule() {
    return FutureBuilder(
      future: getDataFromServer(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Container(
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  'Images/loading.gif',
                  fit: BoxFit.fill,
                ),
              ));
        if (snapshot.hasData) {
          return mytabs.MyTabs(snapshot.data);
        } else if (snapshot.hasError) {
          return Center(
              child: RaisedButton(
            child: Icon(Icons.replay),
            onPressed: () {
              setState(() {
                _home = _buildschedule();
              });
            },
          ));
        } else
          return Container(
              color: Colors.black,
              child: Center(
                child: Image.asset(
                  'Images/loading.gif',
                  fit: BoxFit.fill,
                ),
              ));
      },
    );
  }

  _openMapView() async {
    try {
      final int result = await platform.invokeMethod('openmapview');
    } catch (err) {}
  }

  @override
  void initState() {
    new FirebaseNotifications(context).setUpFirebase();
    _shedule = _buildschedule();
    _home = _shedule;
    _pronight = StarNight();
    // TODO: implement initState
    super.initState();
  }

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Zeitgeist 2k19"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_active,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/notipage');
              },
            )
          ],
        ),
        drawer: Drawer(
            child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                        padding: EdgeInsets.all(0),
                        child: Image.asset(
                          'Images/drawerposter.jpg',
                          fit: BoxFit.fill,
                        )),
                    Container(
                      //margin: EdgeInsets.only(top: 50),
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'Register',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.add),
                        onTap: () {
                          launch("https://www.zeitgeist.org.in/events/");
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'Campus Ambassador',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.work),
                        onTap: () {
                          launch(
                              "https://www.zeitgeist.org.in/campus_ambassador/");
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'Sponsors',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.attach_money),
                        onTap: () {
                          launch("https://www.zeitgeist.org.in/");
                        },
                      ),
                    ),
                    Container(
                      child: ListTile(
                        title: Text(
                          'About us',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Icon(Icons.info),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  about.About("About us")));
                        },
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Team',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(Icons.group),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                team.CoreTeam("CoreTeam")));
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
                ))),
        body: _home,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.white,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                  if (index == 0)
                    _home = _shedule;
                  else if (index == 1)
                    _home = _pronight;
                  else
                    _openMapView();
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    title: Text('Schedule'),
                    backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.star),
                    title: Text('Pro-Nights'),
                    backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
                BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    title: Text('Map'),
                    backgroundColor: Color.fromRGBO(166, 16, 30, 1))
              ]),
        ));
  }

  getDataFromServer() async {
    final response =
        await http.get("http://www.zeitgeist.org.in/data-api/events/");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var jsonData = json.decode(response.body);
      jsonData.sort((a, b) {
        return a['start_date_time']
            .toString()
            .compareTo(b['start_date_time'].toString());
      });
      return jsonData;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
