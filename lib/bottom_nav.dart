import 'package:flutter/material.dart';
import './main.dart';

class MyApp extends StatefulWidget {
  int page;
  MyApp(int p){
    page = p;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState(page);
  }
}

class MyAppState extends State<MyApp> {

  int _selectedPage = 0,page;
  var _pageOptions;

  MyAppState(int p){
    page = p;
    if(page==1)
    {
      _pageOptions = [
        getListViewDay1(),
        getListTile('event_name', 'event_category', 'time'),

        //Text('Day 1 Competions',textAlign: TextAlign.center,),
        //Text('Day 1 Pro nights',textAlign: TextAlign.center,)
      ];
    }
    else if (page == 2)
    {
      _pageOptions = [
        getListViewDay2(),
        getListTile('event_name', 'event_category', 'time'),
      ];
    }

    else if (page == 3)
    {
      _pageOptions = [
        getListViewDay3(),
        getListTile('event_name', 'event_category', 'time'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          body: _pageOptions[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedPage,
              onTap: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Competions')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.work), title: Text('Pro-Nights')),
              ]),
        ));
  }

  Widget getListViewDay1(){
    var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;
  }

  Widget getListViewDay2(){
    var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;
  }

  Widget getListViewDay3(){
    var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;
  }

  Widget getListTile(String event_name,String event_category,String time){
    var listTile = ListTile(
      leading: Icon(Icons.image),
      title: Text(event_name,textScaleFactor: 1.5,),
      subtitle: Text(event_category),
      trailing: Text(time),
    );

    return listTile;
  }
}
