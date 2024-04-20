import 'package:flutter/material.dart';

class NewsComponent extends StatelessWidget {
  final String newsName;
  final String newsPath;

  const NewsComponent({
    super.key,
    required this.newsPath,
    required this.newsName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              newsPath,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Text(newsName)
        ],
      ),
    );
  }
}
