import 'package:flutter/material.dart';

bool isChecked = false;

class Task extends StatefulWidget {
  const Task({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.red;
    }

    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          color: Colors.white,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
      ),
    );
  }
}
