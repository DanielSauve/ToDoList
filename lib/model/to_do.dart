class ToDo {
  ToDo(this.completed, this.name){
    this.created = new DateTime.now();
    this.updated = new DateTime.now();
  }

  DateTime created;
  DateTime updated;
  bool completed = false;
  String name = "";
}
