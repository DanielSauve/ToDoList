import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/to_do.dart';

class ToDoListItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ToDoState();
  }
}

class _ToDoState extends State<ToDoListItem> {
  ToDo toDo = new ToDo(false, "Test Item");
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Checkbox(value: this.toDo.completed, onChanged: _onChanged),
        new Flexible(
            child: new Text(
          this.toDo.name,
          style: new TextStyle(fontSize: 16.0,),
        )),
      ],
    );
  }

  _onChanged(bool value) {
    this.setState(() {
      this.toDo.updated = new DateTime.now();
      this.toDo.completed = value;
    });
  }
}
