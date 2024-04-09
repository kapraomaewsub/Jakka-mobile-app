import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: homeAppBar(),
      
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      title: const Text(
        'Menu',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.home),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}