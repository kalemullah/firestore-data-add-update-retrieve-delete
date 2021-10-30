import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final queryInstant = FirebaseFirestore.instance;

class SellScreen extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Going To sells"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: queryInstant.collection('book').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> items = snapshot.data.docs;
              print("My Data: ${snapshot.data.docs}");
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Color btnColor = Colors.black;
                  return Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                            5.0) //                 <--- border radius here
                        ),
                      ),
                      child: ListTile(
                        title: Text("${items[index]["name"]}"),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Text("${items[index]["email"]}"),
                            Text("${items[index]["mobile No"]}"),
                            Text("${items[index]["class"]}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.delete),
                                    iconSize: 20,
                                    tooltip: 'Delete data',
                                    color: btnColor,
                                    onPressed: () {
                                      setState(() {


                                       deleteUser();
                                      });
                                    }),
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    iconSize: 20,
                                    color: Colors.black,
                                    tooltip: ' edit',
                                    onPressed:(){ updateUser(); } ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
CollectionReference book = FirebaseFirestore.instance.collection('book');

Future<void> deleteUser() {
  return book
      .doc('1')
      .delete()
      .then((value) => print("User Deleted"))
      .catchError((error) => print("Failed to delete user: $error"));
}
CollectionReference users = FirebaseFirestore.instance.collection('book ');

Future<void> updateUser() {
  return users
      .doc('OdpK83KePgunkSp0qhIb')
      .update({'name': ' Sons', 'email':'khn@gmail.com','mobile no':'03333333','class':'1'})
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}