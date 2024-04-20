import 'package:flutter/material.dart';
// import 'package:jakka_app/pages/report_page.dart';
import 'package:intl/intl.dart';
import 'package:jakka_app/components/my_report_column.dart';
import 'package:jakka_app/constants.dart';
import 'package:jakka_app/helper/helper_functions.dart';

class Newreportpage extends StatefulWidget {
  const Newreportpage({super.key});

  @override
  State<Newreportpage> createState() => _NewreportpageState();
}

class _NewreportpageState extends State<Newreportpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: displayAppBar('New Report'),
      body: ListView(
        children: [const SizedBox(height: 15), _newreportSection()],
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
          padding: const EdgeInsets.only(left: 20),
          child: MyNewReportColumn(),
        ),
        Center(
          child: SizedBox(
              height: 100,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: kSkyBlueColor,
                  primaryColorDark: kSkyBlueColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Describe your problem here.',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kSkyBlueColor,
                          width: 2,
                        ),
                      )),
                ),
              )),
        ),
        const Padding(
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
          child: SizedBox(
              height: 100,
              width: 320,
              child: Theme(
                data: ThemeData(
                  primaryColor: kSkyBlueColor,
                  primaryColorDark: kSkyBlueColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Upload your photo here.',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 100, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: kSkyBlueColor,
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
            const SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSkyBlueColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: kSkyBlueColor),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
            ),
            kHomePageSmlSizedBox,
          ],
        )),
      ],
    );
  }
}
