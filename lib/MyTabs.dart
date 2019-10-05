import 'package:flutter/material.dart';
import 'package:zeitgeist/bottom_nav.dart';


class MyTabs extends StatefulWidget {
  final data;
  MyTabs(this.data);
  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<MyTabs> {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        flexibleSpace: TabBar(controller: controller, tabs: <Tab>[
          Tab(
            text: 'Day 1',
          ),
          Tab(
            text: 'Day 2',
          ),
          Tab(
            text: 'Day 3',
          ),
        ]),
      ),
      body: TabBarView(controller: controller, children: <Widget>[
        MyApp(1, widget.data),
        MyApp(2, widget.data),
        MyApp(3, widget.data),
      ]),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}