import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lime[900],
        title: Text('Список дел'),
      ),
      body: Column(
        children: [
          Text('Main screen'),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, '/todo');
          }, child: Text('Перейти далее'))
        ],
      ),
    );
  }
}
