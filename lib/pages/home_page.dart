import 'package:flutter/material.dart';
import 'package:jakka_app/components/homePage/my_bike_amount.dart';
import 'package:jakka_app/components/homePage/user_profile.dart';
import 'package:jakka_app/components/homePage/news/my_news_section.dart';
import 'package:jakka_app/components/homePage/user_tab.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/models/news_model.dart';
import 'package:jakka_app/pages/notification_page.dart';
import 'package:intl/intl.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<NewsModel> news = [];

  void _getNews() {
    news = NewsModel.getNews();
  }

  @override
  Widget build(BuildContext context) {
    _getNews();
    return Scaffold(
      appBar: homeAppBar(),
      body: ListView(
        children: [
          kHomePageSizedBox,
          _availableSection(),
          kHomePageSizedBox,
          const MyNewsSection(),
          kHomePageSizedBox,
          _myjakkaSection(),
          kHomePageSizedBox,
        ],
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      title: UserTab(),
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
        MyHomePic(),
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
        child: Container(
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
                  const Text(
                    'No.224',
                    style: TextStyle(
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
        ),
      ),
    ]);
  }
}
