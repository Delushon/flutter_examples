import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/home.dart';
import 'package:flutter_apps/pages/main_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.lightGreen
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => MainScreen(),
    '/todo': (context) => Home()
  },
));