import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app_flutter_tutorial_hive_local_storage_by_mitch_koko/database/database.dart';

import 'util/dialog_box.dart';
import 'util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("my_task_box");
  final _controller = TextEditingController();
  ToDoDatabase database = ToDoDatabase();

  @override
  void initState() {
    if (_myBox.get("TODO_LIST") == null) {
      database.createInitialData();
    } else {
      database.loadData();
    }
    super.initState();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
          onSave: saveNewTask,
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        database.todoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    database.updateData();
    Navigator.of(context).pop();
  }

  deleteTask(int index) {
    setState(() {
      database.todoList.removeAt(index);
    });
    database.updateData();
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      database.todoList[index][1] = !database.todoList[index][1];
    });
    database.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO DO App • Flutter Tutorial Hive Local Storage By Mitch Koko"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: database.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: database.todoList[index][0],
            taskCompleted: database.todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
