import 'package:flutter/material.dart';
import 'add_task_dialog.dart';
import 'task_dialog.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final List<Map<String, dynamic>> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add({"title": task, "completed": false});
    });
  }

  void _markComplete(int index) {
    setState(() {
      _tasks[index]["completed"] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${_tasks[index]["title"]} Completed")),
    );
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _redoTask(int index) {
    setState(() {
      _tasks[index]["completed"] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        actions: [
          IconButton(
            onPressed: () => showAddTaskDialog(context, _addTask),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) => _markComplete(index),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.check, color: Colors.white),
            ),
            child: ListTile(
              title: Text(
                _tasks[index]["title"],
                style: TextStyle(
                  decoration: _tasks[index]["completed"]
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => showTaskDialog(
                  context,
                  _tasks[index]["title"],
                  () => _deleteTask(index),
                  () => _redoTask(index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
