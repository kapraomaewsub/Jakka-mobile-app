import 'package:flutter/material.dart';
// import 'package:jakka_app/pages/report_page.dart';
import 'package:intl/intl.dart';

class Newreportpage extends StatefulWidget {
  const Newreportpage({super.key});

  @override
  State<Newreportpage> createState() => _NewreportpageState();
}

class _NewreportpageState extends State<Newreportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newreportAppBar(),
      body: ListView(
        children: [SizedBox(height: 15), _newreportSection()],
      ),
    );
  }

  AppBar newreportAppBar() {
    return AppBar(
      title: const Text(
        'New Report',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
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

  Column _newreportSection() {
    String formattedDateTime =
        DateFormat('E dd/MM/yyyy HH:mm').format(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Reporter",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text("Student ID: 6587999",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Text("name: Jane Cooper",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Text("Date: ${formattedDateTime}",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Text("Jakka No: 224",
                  style: TextStyle(
                    fontSize: 16,
                  )),
              SizedBox(height: 5),
              Text("Problems",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 5),
            ],
          ),
        ),
        Center(
          child: Container(
              height: 100,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: Color.fromRGBO(189, 205, 234, 1),
                  primaryColorDark: Color.fromRGBO(189, 205, 234, 1),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Describe your problem here.',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(189, 205, 234, 1),
                          width: 2,
                        ),
                      )),
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Photo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
        Center(
          child: Container(
              height: 100,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: Color.fromRGBO(189, 205, 234, 1),
                  primaryColorDark: Color.fromRGBO(189, 205, 234, 1),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Upload your photo here.',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(189, 205, 234, 1),
                          width: 2,
                        ),
                      )),
                ),
              )),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(189, 205, 234, 1),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color.fromRGBO(189, 205, 234, 1)),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 5),
          ],
        )),
      ],
    );
  }
}
