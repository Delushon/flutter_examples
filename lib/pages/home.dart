import 'package:flutter/material.dart';

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

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                      print(todoList);
                    });
                  }, icon: Icon(Icons.delete, color: Colors.red)),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                  print(todoList);
                });
              }
          );
        }
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
                      setState(() {
                        todoList.add(_newToDo);
                      });
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
