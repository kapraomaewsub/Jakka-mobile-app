import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';

class MyUserJakkaNo extends StatelessWidget {
  const MyUserJakkaNo(
      {super.key, required this.formattedDateTime, required this.jakkaNo});

  final String formattedDateTime;
  final String jakkaNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: kSkyBlueColor, // Set the border color here
          width: 2, // Set the border width
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formattedDateTime,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Text(
                'No.$jakkaNo',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(width: 50),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Not',
                style: TextStyle(
                  color: Color.fromRGBO(116, 17, 2, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'returned',
                style: TextStyle(
                  color: Color.fromRGBO(116, 17, 2, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
