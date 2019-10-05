import 'package:flutter/material.dart';
import 'package:zeitgeist/Detail.dart' as Detail;
import 'package:zeitgeist/SampleEvent.dart' as Sample;
import 'package:date_format/date_format.dart';

class MyApp extends StatefulWidget {
  final data;
  final int page;
  MyApp(this.page, this.data);

  @override
  State<StatefulWidget> createState() => MyAppState(page, data);
}

class MyAppState extends State<MyApp> {
  var data;
  int page;
  var _pageOptions;

  MyAppState(int p, dt) {
    data = dt;
    page = p;
    if (page == 1) {
      _pageOptions = getListViewDay('2019-10-11');
    } else if (page == 2) {
      _pageOptions = getListViewDay('2019-10-12');
    } else if (page == 3) {
      _pageOptions = getListViewDay('2019-10-13');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.blue),
      backgroundColor: Colors.white,
      body: _pageOptions,
    );
  }

  _getEventday(day) {
    var jsonData = data;

    List<Sample.SampleEvent> sampleEvents = [];
    for (var u in jsonData) {
      Sample.SampleEvent sampleEvent =
          Sample.SampleEvent(u['name'], u['start_date_time'], u['description']);
      String s = "";
      for (var i = 0; i < 10; i++) {
        s += sampleEvent.start_date_time[i];
      }

      if (s == day) {
        sampleEvents.add(sampleEvent);
      }
    }

    return sampleEvents;
  }

  Widget getListViewDay(day) {
    var eventList = _getEventday(day);
    return Container(
        color: Colors.black87,
        child: ListView.builder(
          itemCount: eventList.length,
          itemBuilder: (BuildContext context, int index) {
            return getListTile(eventList[index]);
          },
        ));
  }

  Widget getListTile(Sample.SampleEvent sampleEvent) {
    DateTime startdateTime = DateTime.parse(sampleEvent.start_date_time);
    final starttime = formatDate(startdateTime, [hh, ':', nn, ' ', am]);
    var listTile = Card(
        color: Colors.orange[300],
        child: ExpansionTile(
          title: Container(
            padding: EdgeInsets.all(0),
            child: ListTile(
              leading: FlightImageAsset(sampleEvent.name),
              title: Text(
                sampleEvent.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                sampleEvent.description + " (" + starttime + ")",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          children: <Widget>[
            Detail.Info(
                Sample.SampleEvent(sampleEvent.name,
                    sampleEvent.start_date_time, sampleEvent.description),
                widget.data)
          ],
        ));

    return listTile;
  }
}

// ignore: must_be_immutable
class FlightImageAsset extends StatefulWidget {
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

    if (widget.name == 'Calypso' ||
        widget.name == 'Tarang' ||
        widget.name == 'Waltz' ||
        widget.name == 'Junoon' ||
        widget.name == 'Smack That' ||
        widget.name == 'Groove-Z' ||
        widget.name == 'Western Dance' ||
        widget.name == 'Street Battle' ||
        widget.name == 'Tarang (Folk Dance)') {
      assetImage = AssetImage('Images/dance.jpg');
    } else if (widget.name == 'Torque' ||
        widget.name == 'Saaz' ||
        widget.name == 'Adagio' ||
        widget.name == 'Harmony' ||
        widget.name == 'Rap-iD' ||
        widget.name == 'Capriccio') {
      assetImage = AssetImage('Images/music.png');
    } else if (widget.name == 'MELA Quiz' ||
        widget.name == 'General Quiz' ||
        widget.name == 'Brainwaves' ||
        widget.name == 'Puzzling Quiz' ||
        widget.name == 'India Quiz' ||
        widget.name == 'Mela Quiz') {
      assetImage = AssetImage('Images/quiz.png');
    } else if (widget.name == 'Fotopedia' || widget.name == 'Pixelerator') {
      assetImage = AssetImage('Images/camera.jpg');
    } else if (widget.name == 'CS-GO' ||
        widget.name == 'FIFA' ||
        widget.name == 'PUBG' ||
        widget.name == 'Fifa') {
      assetImage = AssetImage('Images/gaming.png');
    } else if (widget.name == 'Parley' ||
        widget.name == 'Melodum' ||
        widget.name == 'Spell Bee' ||
        widget.name == 'GD' ||
        widget.name == 'Extempore' ||
        widget.name == 'Turncoat') {
      assetImage = AssetImage('Images/debate.png');
    } else if (widget.name == 'Wall Graffiti' ||
        widget.name == 'On The Spot' ||
        widget.name == 'Face Painting' ||
        widget.name == 'Rangoli' ||
        widget.name == 'Doodle 4 Zeitgeist' ||
        widget.name == 'Poster Designing' ||
        widget.name == 'Shoe Designing' ||
        widget.name == 'Live sketching' ||
        widget.name == 'Poster Making') {
      assetImage = AssetImage('Images/paint.jpg');
    } else if (widget.name == "Director's Cut" ||
        widget.name == 'Ad-Mad' ||
        widget.name == 'Dubsmash') {
      assetImage = AssetImage('Images/videomaking.jpg');
    } else if (widget.name == 'Nukkad Natak' ||
        widget.name == 'Yatharth' ||
        widget.name == 'Chaplin' ||
        widget.name == 'Abhivyakti' ||
        widget.name == 'Improv') {
      assetImage = AssetImage('Images/dramatics.png');
    } else {
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
