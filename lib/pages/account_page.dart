import 'package:flutter/material.dart';
import 'package:jakka_app/pages/login_page.dart';
import 'package:jakka_app/pages/setting_page.dart';
import 'package:jakka_app/pages/about_page.dart';


class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: accountpageAppBar(),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              _userInfoSection(),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: _logoutSection(),
          ),
        ],
      ),
    );
  }

  AppBar accountpageAppBar() {
    return AppBar(
      title: const Text(
        'User Account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      toolbarHeight: 60,
      backgroundColor: Color.fromRGBO(34, 72, 158, 1),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), 
          bottomRight: Radius.circular(25),
        ),
      ),
    );
  }

  Widget _userInfoSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('6587098', style: TextStyle(fontSize: 16)),
                  Text('Patraporn Sukumphanthanasarn',
                      style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10), 
          Divider(
            color: Colors.black, 
            thickness: 1,
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Setting', style: TextStyle(fontSize: 14)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 16,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settingpage()
                          )
                      );
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('About', style: TextStyle(fontSize: 14)),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 16,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Aboutpage()
                          )
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Center _logoutSection() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          
          SizedBox(
            width: 300,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                // Implement logout functionality here
                  Navigator.pushReplacement(
                      context,MaterialPageRoute(
                        builder: (context) => Loginpage()
                      )
                    );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(231, 92, 92, 1),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color.fromRGBO(231, 92, 92, 1)),
                ),
              ),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white,fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: 5),
        ],
      )
    );
  }


}