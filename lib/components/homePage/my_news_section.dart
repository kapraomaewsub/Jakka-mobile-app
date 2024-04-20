import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/models/news_model.dart';

class MyNewsSection extends StatelessWidget {
  const MyNewsSection({
    super.key,
    required this.news,
  });

  final List<NewsModel> news;

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
}
