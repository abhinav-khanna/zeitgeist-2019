import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './SampleEvent.dart' as Sample;
import 'package:date_format/date_format.dart';

class Info extends StatelessWidget {
  Sample.SampleEvent sampleEvent;
  Info(this.sampleEvent);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Detail(sampleEvent);
  }
}

class Detail extends StatefulWidget {
  Sample.SampleEvent sampleEvent;
  Detail(this.sampleEvent);

  @override
  _DetailState createState() => _DetailState(sampleEvent);
}

class _DetailState extends State<Detail> {
  Sample.SampleEvent sampleEvent;
  _DetailState(this.sampleEvent);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange[500],
        child: FutureBuilder(
            future: GetEventDetails(sampleEvent),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text(
                      "Loading....",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                return DetailedLayout(snapshot.data);
              }
            }));
  }

  Future<Sample.Event> GetEventDetails(Sample.SampleEvent sampleEvent) async {
    var data = await http.get("http://www.zeitgeist.org.in/data-api/events/");
    var jsonData = json.decode(data.body);

    Sample.Event event;
    for (var u in jsonData) {
      print('name:' + u['name']);
      if (u['name'] == sampleEvent.name) {
        print("match!!");
        print(u['name'] +
            u['start_date_time'] +
            u['event_type'] +
            u['end_date_time'] +
            u['description'] +
            u['subcategory'].toString());
        event = Sample.Event(
            u['name'],
            u['start_date_time'],
            u['event_type'],
            u['end_date_time'],
            u['description'],
            u['subcategory'],
            u['id'],
            u['first_cash_prize'],
            u['second_cash_prize'],
            u['third_cash_prize'],
            u['first_goodies'],
            u['second_goodies'],
            u['third_goodies'],
            u['minimum_team_size'],
            u['maximum_team_size']);
        print('event finalized');
        break;
      }
    }
    print('returned event name:' + event.name);
    return event;
  }

  Widget DetailedLayout(Sample.Event event) {
    DateTime startdateTime = DateTime.parse(event.start_date_time);
    final starttime = formatDate(startdateTime, [hh, ':', nn, ' ', am]);

    print("Inside Detailed Layout");

    return Container(
        color: Colors.orange[600],
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Start Time: ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(starttime,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              "Type:" + event.event_type,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            (event.maximum_team_size == 1)
                ? (Text(
                    "Group Size:1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ))
                : Text(
                    "Group Size:" +
                        event.minimum_team_size.toString() +
                        "-" +
                        event.maximum_team_size.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
            Text(
              "Prize Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "First:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        event.first_cash_prize.toString() +
                            "+" +
                            event.first_goodies.toString()+"(Prize + Goodies)",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Second:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  event.second_cash_prize.toString() +
                      "+" +
                      event.second_goodies.toString()+"(Prize + Goodies)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Third:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  event.third_cash_prize.toString() +
                      "+" +
                      event.third_goodies.toString()+"(Prize + Goodies)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ));
  }
}
