import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePic extends StatelessWidget {
  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch uesr details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser!.uid)
        .get();
  }

  MyHomePic({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
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

            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('${user!['Profilepic']}'),
              ),
            );
          } else {
            return const Text("No data");
          }
        });
  }
}
