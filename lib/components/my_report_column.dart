import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jakka_app/constants.dart';

class MyNewReportColumn extends StatelessWidget {
  MyNewReportColumn({super.key});

  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch uesr details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser!.uid)
        .get();
  }

  String formattedDateTime =
      DateFormat('E dd/MM/yyyy HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUserDetails(),
      builder: ((context, snapshot) {
        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // error
        else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }

        // data receive
        else if (snapshot.hasData) {
          // extract data
          Map<String, dynamic>? user = snapshot.data!.data();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Reporter", style: kNewReportHeadTextStyle),
              Text(
                "Student ID: ${user!['Student_ID']}",
                style: kReportTextStyle,
              ),
              Text("name: ${user['Firstname']} ${user['Surname']}",
                  style: kReportTextStyle),
              Text("Date: ${formattedDateTime}", style: kReportTextStyle),
              const Text("Jakka No: 224", style: kReportTextStyle),
              const SizedBox(height: 5),
              const Text("Problems", style: kNewReportHeadTextStyle),
              const SizedBox(height: 5),
            ],
          );
        } else {
          return const Text("No data");
        }
      }),
    );
  }
}
