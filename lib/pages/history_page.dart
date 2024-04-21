import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_list_display.dart';
import 'package:jakka_app/helper/helper_functions.dart';
import 'package:jakka_app/models/history_model.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  List<HistoryModel> history = [];

  // void _getHistory() {
  //   history = HistoryModel.getHistory();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('History'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _historySection(),
        ],
      ),
    );
  }

  Column _historySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          width: 500,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("History")
                .where("user",
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .orderBy('Date', descending: true)
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

              return ListView.separated(
                itemCount: histories.length,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  // gei individual history
                  final history = histories[index];

                  // get data from each history

                  var timest = history['Date'];
                  var newew = DateTime.parse(timest.toDate().toString());
                  var formattedDateTime = displayDateFormat(newew);
                  String jakkaNo = history['Jakka_No'];
                  bool returned = history['Returned'];

                  String returnedMsg = returned ? 'Returned' : 'Not Returned';

                  TextStyle returnedTextStyle = TextStyle(color: Colors.green,fontWeight: FontWeight.bold);
                  TextStyle notReturnedTextStyle = TextStyle(color: Colors.red,fontWeight: FontWeight.bold);
                  TextStyle textStyling =
                      returned ? returnedTextStyle : notReturnedTextStyle;

                  //print(formattedDateTime);

                  return MyListMessage(
                    leftTop: formattedDateTime,
                    leftBtm: 'Jakka No. $jakkaNo',
                    rightSec: returnedMsg, 
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
