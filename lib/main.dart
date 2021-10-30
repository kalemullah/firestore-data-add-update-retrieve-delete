import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'students.dart';
import 'input_screen.dart';
import 'sell_screen.dart';
import 'online_books.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'students',
      routes: <String, WidgetBuilder> {
        '/students': (BuildContext context) => students(),
        '/input_screen' : (BuildContext context) => input_screen(),
        '/screen3' : (BuildContext context) => SellScreen(),
        '/screen4' : (BuildContext context) => online_books(),
      },
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
    );
  }
}
