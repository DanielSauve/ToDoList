import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/to_do_list_item.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new ToDoList(title: 'ToDo List'),
    );
  }
}

class ToDoList extends StatefulWidget {
  ToDoList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ToDoListState createState() => new _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Widget> items = [];

  void _addNewItem() {
    setState(() {
      items.add(new ToDoListItem());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: items,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addNewItem,
        tooltip: 'Add New Item ToDo',
        child: new Icon(Icons.add),
      ),
    );
  }
}
