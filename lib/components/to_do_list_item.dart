import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/to_do.dart';

class ToDoListItem extends StatefulWidget {
  ToDoListItem({this.toDo});

  final ToDo toDo;

  @override
  State<StatefulWidget> createState() {
    return new _ToDoState();
  }
}

class _ToDoState extends State<ToDoListItem> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Checkbox(value: widget.toDo.completed, onChanged: _onChanged),
        new Flexible(
            child: new Text(
          widget.toDo.name,
          style: new TextStyle(
            fontSize: 16.0,
          ),
        )),
      ],
    );
  }

  _onChanged(bool value) {
    this.setState(() {
      widget.toDo.updated = new DateTime.now();
      widget.toDo.completed = value;
    });
  }
}
