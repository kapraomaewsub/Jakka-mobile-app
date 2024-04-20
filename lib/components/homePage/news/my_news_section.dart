import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/homePage/news/my_news_component.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';

class MyNewsSection extends StatelessWidget {
  const MyNewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        kHomePageSmlSizedBox,
        SizedBox(
          height: 150,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("News").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                displayMessageToUser("Something went wrong", context);
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
              final news = snapshot.data!.docs;

              return ListView.separated(
                itemCount: news.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  // gei individual history
                  final neww = news[index];

                  // get data from each history
                  String newsName = neww['name'];
                  String newsPath = neww['imagepath'];

                  return NewsComponent(
                    newsName: newsName,
                    newsPath: newsPath,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
