import 'package:flutter/material.dart';
import 'package:jakka_app/pages/login_page.dart';
import 'package:jakka_app/pages/home_page.dart';
import 'package:jakka_app/pages/history_page.dart';
import 'package:jakka_app/pages/myqr_page.dart';
import 'package:jakka_app/pages/report_page.dart';
import 'package:jakka_app/pages/account_page.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  bool isLoggedIn = true; //chage to flase!! when implement authen

  static const List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    MyQRpage(),
    Historypage(),
    Reportpage(),
    Accountpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
    ? Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: SizedBox(
        height: 65,
        child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),

        child: Container(
          child: BottomNavigationBar(
            
            backgroundColor: Color.fromRGBO(214, 205, 197, 0.5),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'My QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.report_gmailerrorred_outlined),
                label: 'Report',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: _onItemTapped,
            
            showSelectedLabels: false,
            showUnselectedLabels: false,

            selectedIconTheme: IconThemeData(color: Colors.black,),
            unselectedIconTheme: IconThemeData(color: Colors.grey,),

          ),
        ),
        ),
      ),
    )
    : Loginpage();
  }
}
