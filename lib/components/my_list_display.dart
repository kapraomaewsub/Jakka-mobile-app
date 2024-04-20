import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';

class MyListMessage extends StatefulWidget {
  final String leftTop;
  final String leftBtm;
  final String rightSec;

  const MyListMessage(
      {super.key,
      required this.leftTop,
      required this.leftBtm,
      required this.rightSec});

  @override
  State<MyListMessage> createState() => _MyListMessageState();
}

class _MyListMessageState extends State<MyListMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(245, 245, 245, 1),
        border: Border.all(
          color: kSkyBlueColor,
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
                      decoration: kListBoxDecoration,
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.leftTop),
                        Text(widget.leftBtm),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.rightSec,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
