import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jakka_app/constants.dart';

// display error message to user
void displayMessageToUser(String message, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(message),
    ),
  );
}

String displayDateFormat(DateTime date) {
  DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
  String formattedDate = dateFormat.format(date);
  return formattedDate;
}

AppBar displayAppBar(String txt) {
  return AppBar(
    title: Text(
      txt,
      style: const TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    ),
    toolbarHeight: 60,
    backgroundColor: kAppbarBg,
    centerTitle: true,
    shape: kAppbarShape,
  );
}

Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton(
      onPressed: onClicked,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(44),
          backgroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          shape: const ContinuousRectangleBorder()),
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(title)
        ],
      ),
    );

// New Report Page
Widget showRepoterConponent(
        {required String studentID,
        required String name,
        required String dateTime,
        required String jakkaNo}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Reporter", style: kNewReportHeadTextStyle),
        Text(
          "Student ID: $studentID",
          style: kReportTextStyle,
        ),
        Text("name: $name", style: kReportTextStyle),
        Text("Date: $dateTime", style: kReportTextStyle),
        Text("Jakka No: $jakkaNo", style: kReportTextStyle),
        const SizedBox(height: 12),
        const Text("Problems", style: kNewReportHeadTextStyle),
        const SizedBox(height: 5),
      ],
    );
