import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';
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
      appBar: displayAppBar('Notifications'),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _notificationSection(),
        ],
      ),
    );
  }

  Column _notificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
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
                  color: kWhiteColor,
                  border: Border.all(
                    color: kSkyBlueColor,
                    width: 2, // Set the border width
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 46,
                                width: 20,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(189, 205, 234, 1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    bottomLeft: Radius.circular(7),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(notification[index].topic),
                                  // Text(notification[index].jakkaNo),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            notification[index].date,
                          ),
                        ],
                      ),
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
