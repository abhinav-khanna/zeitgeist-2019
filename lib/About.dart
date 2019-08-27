import 'package:flutter/material.dart';

class About extends StatelessWidget{

  String title;
  About(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(139,0,0,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(20,24,82,1),
        title: Text("About us",
            style:TextStyle(
              color: Colors.white
            )),
      ),

      body:ListView(
        children: <Widget>[
          Card(
            child:Container(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: Text("Deemed as the largest Cultural Fest in Punjab-Haryana, "
                  "Zeitgeist is not just another event at IIT ROPAR,"
                  " it is an experience to be lived, and it will leave behind memories that "
                  "you will cherish for a lifetime.",
                style: TextStyle(
                    color: Color.fromRGBO(139,0,0,1),
                    fontSize: 20
                ),),
            )
          ),

          Card(
              child:Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Text(
                    " A 4 day extravaganza with a plethora of events in Singing, Dancing, Dramatics,"
                    " Quizzing, Fashion, Oration, Poetry, Stand-up shows ",
                  style: TextStyle(
                      color: Color.fromRGBO(139,0,0, 1),
                      fontSize: 20
                  ),),
              )
          ),

          Card(
              child:Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Text(
                    "Fun-filled and entertaining star nights, that have previously featured the best "
                    "that Bollywood has to offer, Vishal-Shekhar, Ranjit Bawa, Mohit Chauhan, "
                    "Gajendra Verma, and also International sensations such as Olly Esse and "
                    "Havas Guruhi, Zeitgeist has grown over the years into a showcase of spectacle, "
                    "an event like no other. ",
                  style: TextStyle(
                      color: Color.fromRGBO(139,0,0, 1),
                      fontSize: 20
                  ),),
              )
          ),

          Card(
              child:Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Text("This year’s theme, “A Gothic Poltergeist”, promises to be "
                    "an edge of the seat thriller, so be warned, cause this time, it is not for the faint hearted.",
                  style: TextStyle(
                      color: Color.fromRGBO(139,0,0, 1),
                      fontSize: 20
                  ),),
              )
          ),

        ],
      )

    );
  }

}

/*class About extends StatelessWidget {
  final String title;

  About(this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: Text(title),
          backgroundColor: Color.fromRGBO(150,0,0,1),
        ),

        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/shekhar.jpg'),
                    fit: BoxFit.cover),

                  ),
                ),

                Column(
                  children: <Widget>[
                    Text(
                        "Deemed as the largest Cultural Fest in Punjab-Haryana, "
                            "Zeitgeist is not just another event at IIT ROPAR,"
                            " it is an experience to be lived, and it will leave behind memories that "
                            "you will cherish for a lifetime."
                            " A 4 day extravaganza with a plethora of events in Singing, Dancing, Dramatics,"
                            " Quizzing, Fashion, Oration, Poetry, Stand-up shows as well as "
                            "Fun-filled and entertaining star nights, that have previously featured the best "
                            "that Bollywood has to offer, Vishal-Shekhar, Ranjit Bawa, Mohit Chauhan, "
                            "Gajendra Verma, and also International sensations such as Olly Esse and "
                            "Havas Guruhi, Zeitgeist has grown over the years into a showcase of spectacle, "
                            "an event like no other. This year’s theme, “A Gothic Poltergeist”, promises to be "
                            "an edge of the seat thriller, so be warned, cause this time, it is not for the faint hearted.",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                    ),

                    Column(
                      children: <Widget>[
                        Text("15000+",
                            style: TextStyle(
                                fontSize: 50.0,
                                color: Color.fromRGBO(200, 0, 0, 1)
                            ),
                            textAlign: TextAlign.center
                        ),
                        Text("Footfall",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromRGBO(100, 100, 100, 1)
                            ),
                            textAlign: TextAlign.center
                        )
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text("45+",
                            style: TextStyle(
                                fontSize: 50.0,
                                color: Color.fromRGBO(200, 0, 0, 1)
                            ),
                            textAlign: TextAlign.center
                        ),
                        Text("Events",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromRGBO(100, 100, 100, 1)
                            ),
                            textAlign: TextAlign.center
                        )
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Text("5+",
                          style: TextStyle(
                            fontSize: 50.0,
                            color: Color.fromRGBO(200, 0, 0, 1),

                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text("Star Nights",
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromRGBO(100, 100, 100, 1)
                            ),
                            textAlign: TextAlign.center
                        )
                      ],
                    ),


                  ],
                )
              ],
            );
          }),
            );
          }

}*/
