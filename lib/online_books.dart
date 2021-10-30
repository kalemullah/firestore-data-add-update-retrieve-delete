import 'package:flutter/material.dart';
class online_books extends StatefulWidget {
  @override
  _online_booksState createState() => _online_booksState();
}

class _online_booksState extends State<online_books> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Book Bank'),
      centerTitle: true,
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        RaisedButton(child: Text("Ooh! sorry no book available"),),
          ],
        ),
      ),
    );
  }
}


