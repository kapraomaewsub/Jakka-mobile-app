import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_bike_amount.dart';
import 'package:jakka_app/components/my_home_page_pic.dart';
import 'package:jakka_app/components/user_tab.dart';
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
          SizedBox(height: 20),
          _availableSection(),
          SizedBox(height: 20),
          _newsSection(),
          SizedBox(height: 20),
          _myjakkaSection(),
          SizedBox(height: 20),
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
    String formattedDateTime =
        DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
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
      SizedBox(height: 5),
      Center(child: BikeAmount()),
    ]);
  }

  Column _newsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Jakka News',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: news.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage(news[index].imagePath),
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(news[index].name)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
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
      SizedBox(height: 5),
      Center(
        child: Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color:
                  Color.fromRGBO(189, 205, 234, 1), // Set the border color here
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
                    '${formattedDateTime}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'No.224',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
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
