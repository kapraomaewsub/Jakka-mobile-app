import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/components/my_user_account.dart';
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
              const SizedBox(height: 20),
              _userInfoSection(),
              const SizedBox(height: 20),
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
      automaticallyImplyLeading: false,
      title: const Text(
        'User Account',
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

  Widget _userInfoSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyUserAccount(),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Setting', style: TextStyle(fontSize: 14)),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 16,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settingpage()));
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('About', style: TextStyle(fontSize: 14)),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 16,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Aboutpage()));
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
              FirebaseAuth.instance.signOut().then((value) {
                print("Signed  Out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Loginpage()));
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(231, 92, 92, 1),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color.fromRGBO(231, 92, 92, 1)),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    ));
  }
}
