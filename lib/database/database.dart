import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];

  final _myBox = Hive.box("my_task_box");

  void createInitialData() {
    todoList = [
      ["Learn", false],
      ["Earn", false],
      ["Burn", false],
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODO_LIST");
  }

  void updateData() {
    _myBox.put("TODO_LIST", todoList);
    _myBox.flush();
  }
}
