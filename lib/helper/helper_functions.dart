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
