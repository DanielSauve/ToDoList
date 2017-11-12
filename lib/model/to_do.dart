import 'dart:convert';

class ToDo {
  DateTime created;
  DateTime updated;
  bool completed;
  String name;
}

class ToDoSerializer {
  const ToDoSerializer();

  String toJson(ToDo toDo) {
    return '{\n'
        '  "completed": ${toDo.completed},\n'
        '  "name": "${toDo.name}",\n'
        '  "created": ${toDo.created.millisecondsSinceEpoch},\n'
        '  "updated": ${toDo.updated.millisecondsSinceEpoch}\n'
        '}';
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
