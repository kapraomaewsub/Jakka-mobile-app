// import 'package:flutter/material.dart';

class NewsModel {
  String name;
  String imagePath;


  NewsModel(
    {required this.name, required this.imagePath}
  );

  static List<NewsModel> getNews() {
    List<NewsModel> news = [];
    news.add(NewsModel(
        name: 'Closed',
        imagePath: 'assets/news/news1.jpg',));

    news.add(NewsModel(
        name: 'Take a trip',
        imagePath: 'assets/news/news2.jpg',));

    news.add(NewsModel(
        name: 'Let\'s fix',
        imagePath: 'assets/news/news3.jpg',));

    return news;
  }
}
