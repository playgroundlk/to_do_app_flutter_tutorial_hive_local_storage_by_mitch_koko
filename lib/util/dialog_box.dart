import 'package:flutter/material.dart';
import 'my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  final TextEditingController controller;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // icon: const Icon(Icons.add),
      title: const Text('Create New Task'),
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                fillColor: Colors.black12,
                border: OutlineInputBorder(),
                hintText: "New task name",
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MyButton(text: "Cancel", onPressed: onCancel),
                MyButton(text: "Add", onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
