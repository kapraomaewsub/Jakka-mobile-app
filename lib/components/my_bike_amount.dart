import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BikeAmount extends StatelessWidget {
  BikeAmount({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDateTime =
        DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Jakka_Bike")
          .where("Available", isEqualTo: true)
          .snapshots(),
      builder: (context, snapshot) {
        // an errors
        if (snapshot.hasError) {
          Text("Something went wrong");
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
        final users = snapshot.data!.docs;

        return Container(
          height: 120,
          width: 320,
          decoration: BoxDecoration(
            color: Color.fromRGBO(189, 205, 234, 0.5),
            borderRadius: BorderRadius.circular(20), // Set border radius
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${formattedDateTime}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${users.length} คัน',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Image(
                image: AssetImage('assets/bicycle_icon.png'),
                height: 120,
                width: 120,
              ),
            ],
          ),
        );
      },
    );
  }
}
