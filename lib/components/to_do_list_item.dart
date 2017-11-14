import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/to_do.dart';

class ToDoListItem extends StatefulWidget {
  ToDoListItem({this.toDo});

  final ToDo toDo;

  @override
  _ToDoState createState() {
    return new _ToDoState();
  }
}

class _ToDoState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading:
          new Checkbox(value: widget.toDo.completed, onChanged: _onChanged),
      title: new Text(
        widget.toDo.name,
      ),
      onTap: () => print("test"),
    );
  }

  _onChanged(bool value) {
    this.setState(() {
      widget.toDo.updated = new DateTime.now();
      widget.toDo.completed = value;
    });
  }
}
