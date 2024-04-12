import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jakka_app/main.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 400,
          margin: EdgeInsets.all(25),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(239, 238, 241, 1),
            border: Border.all(
                color: Color.fromRGBO(239, 238, 241, 1)),
            borderRadius: BorderRadius.circular(25),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('assets/Mahidol_U.png'),
                      width: 95,
                      height: 95),
                  SizedBox(width: 20),
                  Image(
                      image: AssetImage('assets/JakkaCenter.png'),
                      width: 95,
                      height: 95),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailTextController,

                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'name.sur@student.mahidol.ac.th',
                  fillColor: Color.fromRGBO(245, 245, 245, 1),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(166, 166, 166, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: _passwordTextController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor: Color.fromRGBO(245, 245, 245, 1),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  border: OutlineInputBorder(
                    borderSide:BorderSide(color: Color.fromRGBO(166, 166, 166, 1)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final UserCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );

                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => BottomNavigationBarExample()));
                    } catch (e) {
                        if (e is FirebaseAuthException) {
                          print('FirebaseAuthException: ${e.message}');
                        }else {
                          print('Error: $e');
      
                        }
                    }
                  },
                  
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(189, 205, 234, 1)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Padding
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Border radius
                        side: BorderSide(color: Color.fromRGBO(189, 205, 234, 1)), // Border color
                      ),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}