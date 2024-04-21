import 'package:flutter/material.dart';

class DisplayUserInfo extends StatelessWidget {
  final String firstName;
  final String surName;

  const DisplayUserInfo(
      {super.key, required this.firstName, required this.surName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hello,', style: TextStyle(fontSize: 16)),
        Text("$firstName ${surName[0]}.", style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
