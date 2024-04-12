 import 'package:flutter/material.dart';

class Newreportpage extends StatefulWidget {
  const Newreportpage({super.key});

  @override
  State<Newreportpage> createState() => _NewreportpageState();
}

class _NewreportpageState extends State<Newreportpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: newreportAppBar(),
      
    );
  }

  AppBar newreportAppBar() {
    return AppBar(
      title: const Text(
        'New Report',
        style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold
        ),
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