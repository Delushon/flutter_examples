import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey),

      home: Scaffold(

        appBar: AppBar(
          title: Text('My App'),
          centerTitle: true,
        ),

        body: Container(
          color: Colors.red,
          margin: EdgeInsets.all(45.0),
          padding: EdgeInsets.all(20.0),
          child: Text('text'),
      ),

    ));
  }

}