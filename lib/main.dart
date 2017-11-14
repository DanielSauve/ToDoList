import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'components/to_do_list_item.dart';
import 'model/to_do.dart';

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
  List<ToDo> items = [];

  @override
  void initState() {
    super.initState();
    _readFile().then((String str) {
      for (var i in JSON.decode(str)){
        setState(() => items.add(new ToDoSerializer().fromJSON(i)));
      }
    });
  }

  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/list.json');
  }

  Future<String> _readFile()async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return contents;
    } on FileSystemException {
      return "";
    }
  }

  void _addNewItem() {
    final TextEditingController _controller = new TextEditingController();
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("Add New ToDo"),
          content: new TextField(
            controller: _controller,
          ),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text("Cancel")),
            new FlatButton(
                onPressed: () {
                  setState(() {
                    items.add(new ToDo()
                      ..name = _controller.text
                      ..completed = false
                      ..created = new DateTime.now()
                      ..updated = new DateTime.now());
                  });
                  _getLocalFile().then((File file) => file.writeAsString(JSON.encode(items)));
                  Navigator.of(context).pop();
                },
                child: new Text("Save"))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          children: items.map((i) => new ToDoListItem(toDo: i)).toList(),
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
