import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_qr_code.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';

class MyQRpage extends StatefulWidget {
  const MyQRpage({super.key});

  @override
  State<MyQRpage> createState() => _MyQRpageState();
}

class _MyQRpageState extends State<MyQRpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('My QR'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _myqrSection(),
        ],
      ),
    );
  }

  Column _myqrSection() {
    return Column(
      children: [
        Center(
          child: Container(
            height: 360,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kSkyBlueColor, // Set the border color here
                width: 2, // Set the border width
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: kSkyBlueColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'My QR Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const Text(
                      'Please be careful when showing the QR Code',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const Text(
                      'as it contains personal information.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyQRCode(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
