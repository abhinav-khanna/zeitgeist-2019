import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import './SampleEvent.dart' as Sample;
import 'package:date_format/date_format.dart';

class Info extends StatefulWidget {
  final data;
  final Sample.SampleEvent sampleEvent;
  Info(this.sampleEvent, this.data);

  @override
  _DetailState createState() => _DetailState(sampleEvent);
}

class _DetailState extends State<Info> {
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
    var jsonData = widget.data;

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
            u['maximum_team_size'],
            u['link_to_rulebook']);
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
                Text(
                  starttime,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Text(
              "Type: " + event.event_type,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            (event.maximum_team_size == 1)
                ? (Text(
                    "Group Size: 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ))
                : Text(
                    "Group Size: " +
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
              "Worth",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
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
                      "First: ",
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
                        (event.first_cash_prize + event.first_goodies)
                            .toString(),
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
                  "Second: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  (event.second_cash_prize + event.second_goodies).toString(),
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
                  "Third: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  (event.third_cash_prize + event.third_goodies).toString(),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    launch('https://zeitgeist.org.in/register/' +
                        event.id.toString());
                  },
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: Text(
                    'Rule Book',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    launch(
                        event.link_to_rulebook);
                  },
                ),
              ],
            )
          ],
        ));
  }
}
