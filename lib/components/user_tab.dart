import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserTab extends StatelessWidget {
  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch uesr details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser!.uid)
        .get();
  }

  UserTab({super.key});

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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hello,', style: TextStyle(fontSize: 16)),
                Text("${user!['Firstname']} ${user['Surname'][0]}.",
                    style: const TextStyle(fontSize: 18)),
              ],
            );
          } else {
            return const Text("No data");
          }
        });
  }
}
