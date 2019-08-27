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


/*class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with TickerProviderStateMixin{

  TabController controller,controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(vsync: this,length: 3);
    controller2 = TabController(vsync: this,length: 2);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    int _selectedUpPage=0,_selected_BottomPage=0;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Zeitgeist"),
          backgroundColor: Colors.deepOrange,
          bottom: TabBar(
              controller: controller,
              tabs: <Tab>[
                Tab(text: 'Day 1',),
                Tab(text: 'Day 2',),
                Tab(text: 'Day 3',),
              ]),
        ),
        body: TabBarView(
            controller: controller,
            children: <Widget>[
              first.First(),
              second.Second(),
              third.Third()
            ]),

        drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                    child: Text('This is Drawer Header')
                ),
                ListTile(
                  title: Text('Info 1',textScaleFactor: 2,),
                ),

                ListTile(
                    title: Text('Info 2',textScaleFactor: 2,)
                ),

                ListTile(
                    title: Text('Info 3',textScaleFactor: 2,)
                ),

                ListTile(
                    title: Text('Info 4',textScaleFactor: 2,)
                ),
              ],
            )
        )
    );
  }

}*/
