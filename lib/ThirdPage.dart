import 'package:flutter/material.dart';
import 'bottom_nav.dart';
class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Container(
        child:Center(
          child:Icon(Icons.local_pizza,size:150.0,color: Colors.teal,),
        )
    );
  }*/
    return MyApp(3);
  }
}


class Sample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.green,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            new BottomNavigationBarItem(
              icon: new Icon(Icons.add),
              title: new Text("Add"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.delete),
              title: new Text("Delete"),
            )
          ],
        ),
      ),
    );
  }

}