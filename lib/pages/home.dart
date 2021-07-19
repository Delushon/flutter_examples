import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _newToDo = "";
  List todoList = [];



  @override
  void initState() {
    super.initState();
    todoList.addAll(['first', 'second', 'third']);
  }

  void _menuOpen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Меню'),),
        body: Row(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }, child: Text('На главную'))

          ],
        )
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lime[900],
        title: Text('Список дел'),
        actions: [
          IconButton(onPressed: _menuOpen, icon: Icon(Icons.menu))
        ],
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return Text('Нет записей');

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                    key: Key(snapshot.data!.docs[index].id),
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index].get('item')),
                        trailing: IconButton(onPressed: () {
                          FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                        }, icon: Icon(Icons.delete, color: Colors.red)),
                      ),
                    ),
                    onDismissed: (direction) {
                      FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                    }
                );
              }
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lime[900],
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавить в список:'),
              content: TextField(
                onChanged: (String value) {
                  _newToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('items').add({'item': _newToDo});
                      Navigator.of(context).pop();
                      },
                    child: Text('Добавить')
                )
              ],
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
