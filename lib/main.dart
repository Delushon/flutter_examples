import 'package:flutter/material.dart';
import 'package:flutter_apps/pages/home.dart';
import 'package:flutter_apps/pages/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main() {
  initFirebase();
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.lightGreen
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/todo': (context) => Home()
    },
  ));
}