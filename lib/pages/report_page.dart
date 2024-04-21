import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_list_display.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';
import 'package:jakka_app/pages/newreport_page.dart';
import 'package:intl/intl.dart' as intl;

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
                .orderBy("Date", descending: true)
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
                  //var timestamp = history['Date'];
                  DateTime dt = (history['Date'] as Timestamp).toDate();
                  String formattedDate =
                      intl.DateFormat('dd/MM/yyyy HH:mm').format(dt);
                  String jakkaNo = history['Jakka_No'];
                  String status = history['Status'];

                  TextStyle acceptedTextStyle = const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold);
                  TextStyle underRepairTextStyle = const TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold);
                  TextStyle fixedTextStyle = const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold);

                  TextStyle textStyling;
                  if (status == 'Accepted') {
                    textStyling = acceptedTextStyle;
                  } else if (status == 'Under Repair') {
                    textStyling = underRepairTextStyle;
                  } else if (status == 'Fixed') {
                    textStyling = fixedTextStyle;
                  } else {
                    textStyling = TextStyle(color: Colors.black); // Default
                  }

                  return MyListMessage(
                    leftTop: formattedDate,
                    leftBtm: 'Jakka No. $jakkaNo',
                    rightSec: status,
                    rightSecStyle: textStyling,
                  );
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
