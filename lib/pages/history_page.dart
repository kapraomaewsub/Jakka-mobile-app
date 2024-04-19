import 'package:flutter/material.dart';
import 'package:jakka_app/models/history_model.dart';

class Historypage extends StatefulWidget {
  const Historypage({super.key});

  @override
  State<Historypage> createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  List<HistoryModel> history = [];

  void _getHistory() {
    history = HistoryModel.getHistory();
  }

  @override
  Widget build(BuildContext context) {
    _getHistory();
    return Scaffold(
      appBar: historyAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 20),
          _historySection(),
        ],
      ),
    );
  }

  AppBar historyAppBar() {
    return AppBar(
      title: const Text(
        'History',
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

  Column _historySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 500,
          width: 500,
          child: ListView.separated(
            itemCount: history.length,
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(history[index].date),
                                  Text(history[index].jakkaNo),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            history[index].status,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
