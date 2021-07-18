import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: UserPanel(),
));

class UserPanel extends StatelessWidget {
  const UserPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
                )
              ],
            )
          ],
        )
      ),
    );
  }
}
