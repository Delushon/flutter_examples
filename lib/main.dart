import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatefulWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  _UserPanelState createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  
  double _count = 0.1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('User panel'),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 20.0)),
                Text('mr. John', style: TextStyle(fontSize: 25.0)),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                CircleAvatar(
                  backgroundImage: AssetImage('images/getty-googleplex-office.jpg'),
                  radius: 40.0,
                ),
                Padding(padding: EdgeInsets.only(top: 30.0)),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                    Text('john@google.com', style: TextStyle(color: Colors.blue),)
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 50.0)),
                Text('Count $_count', style: TextStyle(fontSize: 40.0),)
              ],
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {setState(() {
            _count *= 2;
          });},
          child: Icon(Icons.add),
      ),
    );
  }
}
