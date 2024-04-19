import 'package:flutter/material.dart';

class Aboutpage extends StatefulWidget {
  const Aboutpage({super.key});

  @override
  State<Aboutpage> createState() => _AboutpageState();
}

class _AboutpageState extends State<Aboutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: aboutAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Current Version', style: TextStyle(fontSize: 16)),
                Text('6.0.5', style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Terms and Conditions',
                    style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 16,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Privacy Notice', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 16,
                  onPressed: () {},
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Consent', style: TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  iconSize: 16,
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar aboutAppBar() {
    return AppBar(
      title: const Text(
        'About',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      toolbarHeight: 60,
      backgroundColor: const Color.fromRGBO(34, 72, 158, 1),
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }
}
