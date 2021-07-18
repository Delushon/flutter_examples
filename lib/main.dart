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

        body: Center(
          child: RaisedButton(onPressed: () {}, child: Text('click me'),)
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () { print('CLICK!'); },
          child: Text('BUTTON'),
          backgroundColor: Colors.green,
        ),

      ),

    );
  }

}