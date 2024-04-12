import 'package:flutter/material.dart';
import 'package:jakka_app/models/notification_model.dart';

class Notificationpage extends StatefulWidget {
  const Notificationpage({super.key});

  @override
  State<Notificationpage> createState() => _NotificationpageState();
}

class _NotificationpageState extends State<Notificationpage> {
  List<NotificationModel> notification = [];

  void _getNotfication() {
    notification = NotificationModel.getNotification();
  }

  @override
  Widget build(BuildContext context) {
    _getNotfication();
    return Scaffold(
      appBar: notificationAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          _notificationSection(),
        ],
      ),
      
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

  Column _notificationSection() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
          height: 500,
          width: 500,
          child: ListView.separated(
            itemCount: notification.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 245, 245, 1),
                  border: Border.all(
                    color: Color.fromRGBO(189, 205, 234, 1),
                    width: 2, // Set the border width
                  ),
                ),
                  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [
                        Container(
                          height: 46,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(189, 205, 234, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            Text(notification[index].topic),
                            // Text(notification[index].jakkaNo),
                          ],
                        ),
                        
                        SizedBox(width: 20),
                        Text(
                          notification[index].date,
                          
                        ),

                        
                      ],
                    ),
                  ],  
                ),
              );
            },
          ),
        ),
        ],
      );
  }
}