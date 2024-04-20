import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyReportColumn extends StatefulWidget {
  MyReportColumn({super.key});

  @override
  State<MyReportColumn> createState() => _MyReportColumnState();
}

class _MyReportColumnState extends State<MyReportColumn> {
  String formattedDateTime =
      DateFormat('E dd/MM/yyyy HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Reporter",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Text("Student ID: 6587999",
            style: TextStyle(
              fontSize: 16,
            )),
        Text("name: Jane Cooper",
            style: TextStyle(
              fontSize: 16,
            )),
        Text("Date: ${formattedDateTime}",
            style: TextStyle(
              fontSize: 16,
            )),
        Text("Jakka No: 224",
            style: TextStyle(
              fontSize: 16,
            )),
        SizedBox(height: 5),
        Text("Problems",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(height: 5),
      ],
    );
  }
}
