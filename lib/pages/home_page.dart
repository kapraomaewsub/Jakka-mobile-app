import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/homePage/my_bike_amount.dart';
import 'package:jakka_app/components/homePage/user_bike_no.dart';
import 'package:jakka_app/components/homePage/user_profile.dart';
import 'package:jakka_app/components/homePage/news/my_news_section.dart';
import 'package:jakka_app/components/homePage/user_tab.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/pages/notification_page.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // current logged in user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future to fetch uesr details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("User")
        .doc(currentUser!.uid)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: FutureBuilder(
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

            return ListView(
              children: [
                kHomePageSizedBox,
                _availableSection(),
                kHomePageSizedBox,
                const MyNewsSection(),
                kHomePageSizedBox,
                _myjakkaSection(),
                kHomePageSizedBox,
              ],
            );
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }

  AppBar homeAppBar({user}) {
    // get user
    final Map<String, dynamic>? user;

    return AppBar(
      title: DisplayUserInfo(firstName: 'Chanomyen', surName: 'Red'),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_active_outlined),
          iconSize: 30,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Notificationpage()));
          },
        ),
        const DisplayUserProfilePic(
          imagePath:
              'https://firebasestorage.googleapis.com/v0/b/jakkaapp.appspot.com/o/Student%2FProfilepic%2FUser_04.jpg?alt=media&token=7b4d2c61-ba86-4c03-9abd-592f62ba26b3',
        ),
      ],
    );
  }

  Column _availableSection() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'Jakka Availabled',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      kHomePageSmlSizedBox,
      Center(child: BikeAmount()),
    ]);
  }

  Column _myjakkaSection() {
    String formattedDateTime =
        DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          'My Jakka',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      kHomePageSmlSizedBox,
      Center(
        child: MyUserJakkaNo(
          formattedDateTime: formattedDateTime,
          jakkaNo: '224',
        ),
      ),
    ]);
  }
}
