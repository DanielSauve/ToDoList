import 'dart:convert';

class ToDo {
  DateTime created;
  DateTime updated;
  bool completed;
  String name;

  String toJson() {
    return new ToDoSerializer().toJson(this);
  }
}

class ToDoSerializer {
  const ToDoSerializer();

  String toJson(ToDo toDo) {
    return '{"completed": ${toDo.completed}, "name": "${toDo.name}", "created": ${toDo.created.millisecondsSinceEpoch}, "updated": ${toDo.updated.millisecondsSinceEpoch}}';
  }

  ToDo fromJSON(String json) {
    var map = JSON.decode(json) as Map<String, dynamic>;
    return new ToDo()
      ..updated = new DateTime.fromMillisecondsSinceEpoch(map["updated"])
      ..created = new DateTime.fromMillisecondsSinceEpoch(map["created"])
      ..completed = map["completed"]
      ..name = map["name"];
  }
}
