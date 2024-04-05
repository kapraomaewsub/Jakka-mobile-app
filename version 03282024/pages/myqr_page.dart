import 'package:flutter/material.dart';

class MyQRpage extends StatefulWidget {
  const MyQRpage({super.key});

  @override
  State<MyQRpage> createState() => _MyQRpageState();
}

class _MyQRpageState extends State<MyQRpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: myqrAppBar(),
      
    );
  }

  AppBar myqrAppBar() {
    return AppBar(
      title: const Text(
        'My QR',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      toolbarHeight: 60,
      backgroundColor: Color.fromRGBO(34, 72, 158, 1),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), 
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}