import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';

class MyQRpage extends StatefulWidget {
  const MyQRpage({super.key});

  @override
  State<MyQRpage> createState() => _MyQRpageState();
}

class _MyQRpageState extends State<MyQRpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myqrAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          _myqrSection(),
        ],
      ),
    );
  }

  AppBar myqrAppBar() {
    return AppBar(
        title: const Text(
          'My QR',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 60,
        backgroundColor: kAppbarBg,
        centerTitle: true,
        shape: kAppbarShape);
  }

  Column _myqrSection() {
    return Column(
      children: [
        Center(
          child: Container(
            height: 360,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Color.fromRGBO(
                    189, 205, 234, 1), // Set the border color here
                width: 2, // Set the border width
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(189, 205, 234, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'My QR Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
<<<<<<< Updated upstream

                SizedBox(height: 20),

=======
                SizedBox(height: 10),
>>>>>>> Stashed changes
                Column(
                  children: [
                    Text(
                      'Please be careful when showing the QR Code',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'as it contains personal information.',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
<<<<<<< Updated upstream

                    SizedBox(height: 20),

=======
                    SizedBox(height: 10),
>>>>>>> Stashed changes
                    Image(
                      image: AssetImage('assets/qrcode.jpg'),
                      width: 200,
                      height: 200,
                    ),
<<<<<<< Updated upstream

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image(
                    //       image: AssetImage('assets/clock.jpg'),
                    //       width: 16,
                    //       height: 16,
                    //     ),

                        // SizedBox(width: 5),
                        // Text(
                        //   '07:32',
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                    //   ],
                    // ),

                    // SizedBox(height: 10),
                    // Text(
                    //   'Your QR Code will be automatically regenerated',
                    //   style: TextStyle(fontSize: 12,),
                    // ),
                    // Text(
                    //   'every 10 minutes',
                    //   style: TextStyle(fontSize: 12,),
                    // ),

=======
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/clock.jpg'),
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '07:32',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Your QR Code will be automatically regenerated',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'every 10 minutes',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
>>>>>>> Stashed changes
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
