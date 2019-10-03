import 'package:flutter/material.dart';
import 'dart:async';
import 'package:zeitgeist/StarNight.dart' as StarNight;
import 'package:zeitgeist/Detail.dart' as Detail;
import 'package:zeitgeist/SampleEvent.dart' as Sample;

class MyApp extends StatefulWidget {
  final data;
  final int page;
  MyApp(this.page, this.data);

  @override
  State<StatefulWidget> createState() => MyAppState(page,data);
}

class MyAppState extends State<MyApp> {
  var data;
  int _selectedPage = 0,page;
  var _pageOptions;

  MyAppState(int p, dt){
    data = dt;
    page = p;
    if(page==1)
    {
      _pageOptions = [
        getListViewDay1(),
        StarNight.StarNight(),

        //Text('Day 1 Competions',textAlign: TextAlign.center,),
        //Text('Day 1 Pro nights',textAlign: TextAlign.center,)
      ];
    }
    else if (page == 2)
    {
      _pageOptions = [
        getListViewDay2(),
        StarNight.StarNight(),
        //getListTile('event_name', 'event_category', 'time'),
      ];
    }

    else if (page == 3)
    {
      _pageOptions = [
        getListViewDay3(),
        StarNight.StarNight(),
        //getListTile('event_name', 'event_category', 'time'),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //debugShowCheckedModeBanner: false,
        //theme: ThemeData(primarySwatch: Colors.blue),
          backgroundColor: Colors.white,
          body: _pageOptions[_selectedPage],
          // bottomNavigationBar: Theme(
          //   data: Theme.of(context).copyWith(
          //     // sets the background color of the `BottomNavigationBar`
          //       canvasColor: Colors.black,
          //       // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          //       primaryColor: Colors.white,
          //       textTheme: Theme
          //           .of(context)
          //           .textTheme
          //           .copyWith(caption: new TextStyle(color: Colors.white))),
          //   child:BottomNavigationBar(
          //       currentIndex: _selectedPage,
          //       onTap: (int index) {
          //         setState(() {
          //           _selectedPage = index;
          //         });
          //       },
          //       items: [
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.event), title: Text('Schedule'),backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
          //         BottomNavigationBarItem(
          //             icon: Icon(Icons.star), title: Text('Pro-Nights'),backgroundColor: Color.fromRGBO(166, 16, 30, 1)),
          //       ]),
          // )

        );
  }

  Future<List<Sample.SampleEvent>> _getEventday1() async{
    var jsonData = data;
    print(data);

    List<Sample.SampleEvent> sampleEvents=[];
    for(var u in jsonData){

      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
        {
          s+=sampleEvent.start_date_time[i];
        }

      if(s=='2019-10-11')
        {
          sampleEvents.add(sampleEvent);
        }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Future<List<Sample.SampleEvent>> _getEventday2() async{
    var jsonData = data;

    List<Sample.SampleEvent> sampleEvents=[];

    for(var u in jsonData){
      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
      {
        s+=sampleEvent.start_date_time[i];
      }

      if(s=='2019-10-12')
      {
        sampleEvents.add(sampleEvent);
      }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Future<List<Sample.SampleEvent>> _getEventday3() async{
    var jsonData = data;

    List<Sample.SampleEvent> sampleEvents=[];
    for(var u in jsonData){


      Sample.SampleEvent sampleEvent = Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s="";
      for(var i=0;i<10;i++)
      {
        s+=sampleEvent.start_date_time[i];
      }

      if(s=='2019-10-13')
      {
        sampleEvents.add(sampleEvent);
      }
      //events.add(event);
    }

    print(sampleEvents.length);
    return sampleEvents;
  }

  Widget getListViewDay1() {
    /*var listView = ListView
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
      color: Colors.black87,
        child: FutureBuilder(
          future: _getEventday1(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                  style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

  Widget getListViewDay2() {
    /*var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
        child: FutureBuilder(
          future: _getEventday2(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                  style: TextStyle(
                    color: Colors.black
                  ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

 Widget getListViewDay3() {
   /* var listView = ListView(
      children: <Widget>[
        getListTile('a1', 'b1', 't1'),
        getListTile('a2', 'b2', 't2'),
        getListTile('a3', 'b3', 't3'),

      ],
    );
    return listView;*/

    return Container(
        child: FutureBuilder(
          future: _getEventday3(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            if(snapshot.data==null){
              return Container(
                child: Center(
                  child: Text("Loading....",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                    ),),
                ),
              );
            }
            else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context,int index){
                  return getListTile
                    (snapshot.data[index]);

                },
              );
            }},
        )
    );
  }

  Widget getListTile(Sample.SampleEvent sampleEvent) {
   /*var listTile = Card(
        child:ListTile(
          leading: FlightImageAsset(event_name),
          title: Text(event_name,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18
            ),),
          subtitle: Text(event_category,
            style: TextStyle(
                color: Colors.black
            ),),
          trailing: Text(time,
            style: TextStyle(
                color: Colors.black
            ),),
        )
    );

    return listTile;*/

  var listTile = Card(
    color: Colors.orange[300],
     child: ExpansionTile(
         title: Container(
           padding: EdgeInsets.all(0),
           child: ListTile(
             leading: FlightImageAsset(sampleEvent.name),
             title: Text(sampleEvent.name,
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 18,
                   fontWeight: FontWeight.bold
               ),),
             subtitle: Text(sampleEvent.description,
               style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold
               ),),
             onTap: (){},
             /*trailing: Text(time,
               style: TextStyle(
                   color: Colors.black
               ),),*/
           ),
         ),

       children: <Widget>[
         Detail.Info(Sample.SampleEvent(sampleEvent.name,sampleEvent.start_date_time,sampleEvent.description))
       ],
     )
   );

   return listTile;
  }
}



// ignore: must_be_immutable
class FlightImageAsset extends StatefulWidget{
  String name;

  FlightImageAsset(this.name);

  @override
  _FlightImageAssetState createState() => _FlightImageAssetState();
}

class _FlightImageAssetState extends State<FlightImageAsset> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage;

    if(widget.name=='Calypso' || widget.name=='Tarang' || widget.name=='Waltz' || widget.name=='Junoon' || widget.name=='Smack That' || widget.name=='Groove-Z' || widget.name=='Western Dance'
        || widget.name=='Street Battle' || widget.name=='Tarang (Folk Dance)')
      {
        assetImage = AssetImage('Images/dance.jpg');
      }
    else if(widget.name=='Torque' || widget.name=='Saaz' || widget.name=='Adagio' || widget.name=='Harmony' || widget.name=='Rap-iD' || widget.name=='Capriccio')
      {
        assetImage = AssetImage('Images/music.png');
      }
    else if(widget.name=='MELA Quiz' || widget.name=='General Quiz' || widget.name=='Brainwaves' || widget.name=='Puzzling Quiz' || widget.name=='India Quiz' || widget.name=='Mela Quiz')
      {
        assetImage = AssetImage('Images/quiz.png');
      }
    else if(widget.name=='Fotopedia' || widget.name=='Pixelerator')
      {
        assetImage = AssetImage('Images/camera.jpg');
      }
    else if(widget.name=='CS-GO' || widget.name=='FIFA' || widget.name=='PUBG' || widget.name=='Fifa')
      {
        assetImage = AssetImage('Images/gaming.png');
      }
    else if(widget.name=='Parley' || widget.name=='Melodum' || widget.name=='Spell Bee' || widget.name=='GD' || widget.name=='Extempore' || widget.name=='Turncoat')
      {
        assetImage = AssetImage('Images/debate.png');
      }
    else if(widget.name=='Wall Graffiti' || widget.name=='On The Spot' || widget.name=='Face Painting' || widget.name=='Rangoli' || widget.name=='Doodle 4 Zeitgeist'
        || widget.name=='Poster Designing' || widget.name=='Shoe Designing' || widget.name=='Live sketching' || widget.name=='Poster Making')
      {
        assetImage = AssetImage('Images/paint.jpg');
      }

    else if(widget.name=="Director's Cut" || widget.name=='Ad-Mad' || widget.name=='Dubsmash')
      {
        assetImage = AssetImage('Images/videomaking.jpg');
      }
    else if(widget.name=='Nukkad Natak' || widget.name=='Yatharth' || widget.name=='Chaplin' || widget.name=='Abhivyakti' || widget.name=='Improv')
      {
        assetImage = AssetImage('Images/dramatics.png');
      }
    else
      {
        assetImage = AssetImage('Images/festposter.jpg');
      }

    return Container(
      child: CircleAvatar(
        backgroundImage: assetImage,
        radius: 30,
      ),
    );

  }
}


