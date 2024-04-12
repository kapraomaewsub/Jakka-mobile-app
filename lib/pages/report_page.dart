import 'package:flutter/material.dart';
import 'package:jakka_app/models/report_model.dart';
import 'package:jakka_app/pages/newreport_page.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({super.key});

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  List<ReportModel> report = [];

  void _getReport() {
    report = ReportModel.getReport();
  }

  @override
  Widget build(BuildContext context) {
    _getReport();
    return Scaffold(
      appBar: reportpageAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          _reportSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Newreportpage()
                          )
                      );
        },
        child: Icon(Icons.edit),
        backgroundColor: Color.fromRGBO(189, 205, 234, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Color.fromRGBO(189, 205, 234, 1)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  AppBar reportpageAppBar() {
    return AppBar(
      title: const Text(
        'Report Jakka',
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

  Column _reportSection() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Container(
          height: 500,
          width: 500,
          child: ListView.separated(
            itemCount: report.length,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(245, 245, 245, 1),
                  border: Border.all(
                    color: Color.fromRGBO(189, 205, 234, 1),
                    width: 2, // Set the border width
                  ),
                ),
                  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      
                      children: [
                        Container(
                          height: 46,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(189, 205, 234, 1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                            ),
                          ),
                        ),
                        SizedBox(width:10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          
                          children: [
                            Text(report[index].date),
                            Text(report[index].jakkaNo),
                          ],
                        ),
                        
                        SizedBox(width: 20),
                        Text(
                          report[index].status,
                        ),

                        
                      ],
                    ),
                  ],  
                ),
              );
            },
          ),
        ),
        ],
      );
   }

}