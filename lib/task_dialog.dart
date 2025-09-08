import 'package:flutter/material.dart';

void showTaskDialog(
  BuildContext context,
  String taskTitle,
  VoidCallback onDelete,
  VoidCallback onRedo,
) {
  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(taskTitle),
        content: const Text("Choose an action:"),
        actions: [
          TextButton(
            onPressed: () {
              onDelete();
              Navigator.of(ctx).pop();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              onRedo();
              Navigator.of(ctx).pop();
            },
            child: const Text("Redo", style: TextStyle(color: Colors.orange)),
          ),
        ],
      );
    },
  );
}
