import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'sell_screen.dart';
class students extends StatefulWidget {
  @override
  _studentsState createState() => _studentsState();
}

class _studentsState extends State<students> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Bank"),
        centerTitle: true,
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(child: Text("Sell Books"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: (){
              Navigator.pushNamed(context,'/input_screen');
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            splashColor: Colors.grey,
          ),
        SizedBox(height: 3.0,),
          RaisedButton(child: Text("Buy Books"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: (){
              Navigator.pushNamed(context,'/screen3');
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            splashColor: Colors.grey,
          ),
          SizedBox(height: 3.0,),

          RaisedButton(child: Text("online Books "),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            onPressed: (){
              Navigator.pushNamed(context,'/screen4');
            },
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            splashColor: Colors.grey,
          ),



        ],
      ),
       )
     );

  }
}
