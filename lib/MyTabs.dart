import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;
import './About.dart' as about;
import './Team.dart' as team;
import 'package:url_launcher/url_launcher.dart';
import 'package:zeitgeist/StarNight.dart' as StarNight;

class MyTabs extends StatefulWidget {
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
          title: Text("Zeitgeist 2019"),
          backgroundColor: Color.fromRGBO(20, 24, 82, 1),
          bottom: TabBar(
              controller: controller,
              tabs: <Tab>[
                Tab(text: 'Day 1',),
                Tab(text: 'Day 2',),
                Tab(text: 'Day 3',),
              ]),
        ),
        body:
        TabBarView(
            controller: controller,
            children: <Widget>[
              first.First(),
              second.Second(),
              third.Third()
            ]),

        drawer: Drawer(
            child: Container(
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                        padding: EdgeInsets.all(0),
                        child: FlightImageAsset()
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>about.About("About us")));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>team.CoreTeam("CoreTeam")));
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

        )
    );
  }


}


class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage('Images/drawerposter.jpg');
    Image image = Image(image: assetImage,fit: BoxFit.fill, );
    return Container(
      child: image
    );
  }

}