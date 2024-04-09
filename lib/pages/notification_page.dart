import 'package:flutter/material.dart';


class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: notificationAppBar(),
      
      
    );
  }

  AppBar notificationAppBar() {
    return AppBar(
      title: const Text(
        'Notifications',
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