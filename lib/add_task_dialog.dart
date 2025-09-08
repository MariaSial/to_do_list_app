import 'package:flutter/material.dart';

void showAddTaskDialog(BuildContext context, Function(String) addTask) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Add New Task"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter task"),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                addTask(controller.text);
              }
              Navigator.of(ctx).pop();
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
