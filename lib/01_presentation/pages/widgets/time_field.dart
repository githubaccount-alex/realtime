

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeField extends StatelessWidget {
  final String time;
  const TimeField({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.red),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text("API Time Request every second:" ,textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(DateFormat('dd.MM.yyyy HH:mm:ss').format(DateTime.parse(time)),textAlign: TextAlign.center, style: const TextStyle(fontSize: 30)),
            ),
          ),
        ),
      ],
    );
  }
}
