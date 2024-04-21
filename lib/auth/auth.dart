import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/main.dart';
import 'package:jakka_app/pages/home_page.dart';
import 'package:jakka_app/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // user is logged in
            if (snapshot.hasData) {
              return const Homepage();
              // user is NOT logged in
            } else {
              return const Loginpage();
            }
          },
        ),
        bottomNavigationBar: const BottomNavigationBarExample(),
      ),
    );
  }
}
