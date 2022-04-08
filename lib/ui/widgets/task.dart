import 'package:flutter/material.dart';

bool isChecked = false;

class Task extends StatefulWidget {
  const Task({Key? key,required this.taskStatus, required this.title, required this.id, required this.deleteTask, required this.checkTask}) : super(key: key);
  final String title;
  final String id;
  final Function deleteTask;
  final Function checkTask;
  final bool taskStatus;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  get _id => widget.id;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return Colors.red;
    }
    bool isChecked = widget.taskStatus;
    return Dismissible(
      key: Key(widget.id),
      onDismissed: (direction) {
        widget.deleteTask(_id);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Task Deleted"), duration: Duration(seconds: 1)));
      },
      child: ListTile(
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
            widget.checkTask(_id, value);
            if (value == true) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Task Completed"), duration: Duration(seconds: 1)));
            }
          
            }
        
        ),
      ),
    );
  }
}
