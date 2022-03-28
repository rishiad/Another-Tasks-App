import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Calender extends StatefulWidget {
  const Calender({
    Key? key,
    required this.title,
    required this.cancleText,
    required this.confirmText
  }) : super(key: key);
  final String title;
  final String cancleText;
  final String confirmText;
  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: widget.title,
      cancelText: widget.cancleText,
      confirmText: widget.confirmText,
        builder: (context, child) {
    return Theme(
      data: ThemeData.dark(), // This will change to light theme.
      child: child ?? Container(),
    );
  },

    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    // make a widget with a calendar
    return ElevatedButton(
          style: style,
      
      onPressed: () => _selectDate(context),
      child: const Text(
        'Select date',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  void onDateChanged(DateTime value) {
    if (kDebugMode) {
      print(value);
    }
  }
}
