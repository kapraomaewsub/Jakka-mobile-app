import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_list_display.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';
import 'package:jakka_app/pages/newreport_page.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('Report Jakka'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _reportSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Newreportpage()));
        },
        backgroundColor: kSkyBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: kSkyBlueColor),
        ),
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Column _reportSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Report")
                .where("User",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              // an errors
              if (snapshot.hasError) {
                displayMessageToUser("Something went wrong", context);
              }

              // show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data == null) {
                return const Text("No Data");
              }

              // get all users
              final histories = snapshot.data!.docs;

              return ListView.builder(
                itemCount: histories.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  // gei individual history
                  final history = histories[index];

                  // get data from each history

                  var timestt = history['Date'];
                  var neww = DateTime.parse(timestt.toDate().toString());
                  var formattedDateTimee = displayDateFormat(neww);
                  String jakkaNo = history['Jakka_No'];
                  String status = history['Status'];

                  return MyListMessage(
                      leftTop: formattedDateTimee,
                      leftBtm: 'Jakka No. $jakkaNo',
                      rightSec: status);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class DateFormat {
  DateFormat(String s);
}
