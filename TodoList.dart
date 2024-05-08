// ignore: unused_import
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // initial Variable (empty list)
  List<String> _todos = ['task1', 'task2', 'task3'];

  // Creating your own Method call
  void _addTodo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newTodo = '';

          return AlertDialog(
            title: const Text('Enter New Text Below'),
            content: TextField(
              onChanged: (value) {
                newTodo = value;
              },
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _todos.add(newTodo);
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Submit'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Todo List')),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];

          return ListTile(
            title: Text(
              todo,
              style: TextStyle(
                  decoration: todo.startsWith('-')
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            onTap: () {
              setState(() {
                if (todo.startsWith('-')) {
                  _todos[index] = todo.substring(2);
                } else {
                  _todos[index] = '-$todo';
                }
              });
            },
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _addTodo),
    );
  }
}
