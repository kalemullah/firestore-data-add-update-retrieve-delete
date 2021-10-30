import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//final instant=FirebaseFirestore.instance;
class input_screen extends StatefulWidget {
  input_screen({Key key}) : super(key: key);

  @override
  _input_screenState createState() => _input_screenState();
}

class _input_screenState extends State<input_screen> {
  CollectionReference users = FirebaseFirestore.instance.collection('book');

  Future<void> addUser() {
    return users
        .doc('1')
        .set({
          "name": _name,
          "mobile No": _mobile,
          "email": _email,
          "class": _class,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

//  _formKey and _autoValidate
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  String _class;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form '),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
          validator: validateName,
          onChanged: (String val) {
            _name = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          onChanged: (String val) {
            _mobile = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onChanged: (String val) {
            _email = val;
          },
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Class'),
          keyboardType: TextInputType.number,
          validator: validateName,
          onChanged: (String val) {
            _class = val;
          },
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: () {
            addUser();
            // instant.collection("book").add(
            //     {
            //       "name" : _name,
            //       "mobile No": _mobile,
            //       "email" : _email,
            //       "class" : _class,
            //
            //     });
          },
          child: new Text('Submite'),
        )
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
