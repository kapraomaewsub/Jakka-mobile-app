import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
