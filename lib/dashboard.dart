import 'package:flutter/material.dart';
import 'students.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Bank"),
        centerTitle: true,
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[

            MakeDashBoardItem("class 10th", Icons.book_sharp,),
            MakeDashBoardItem("class 9th", Icons.book),
            MakeDashBoardItem("class 8th", Icons.book_online),
            MakeDashBoardItem("class 7th", Icons.book_rounded),
            MakeDashBoardItem("class 6th", Icons.book_online_outlined),
            MakeDashBoardItem("class 5th", Icons.mobile_friendly)
          ],
        ),
      ),
    );
  }
}
class MakeDashBoardItem extends StatelessWidget {
  MakeDashBoardItem(this.clas,this.next);

   String clas;
  var next;
  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 1.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new GestureDetector(
            onTap: () {
              Navigator.pushNamed(context,'/students');
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                      next,
                      size: 40.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(clas,
                      style:
                      new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),

        ));
  }
}
