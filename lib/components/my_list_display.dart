import 'package:flutter/material.dart';
import 'package:jakka_app/constants.dart';

class MyListMessage extends StatefulWidget {
  final String leftTop;
  final String leftBtm;
  final String rightSec;
  final TextStyle? rightSecStyle; // เพิ่ม rightSecStyle เป็น optional

  const MyListMessage({
    Key? key,
    required this.leftTop,
    required this.leftBtm,
    required this.rightSec,
    this.rightSecStyle, // ให้ rightSecStyle เป็น optional
  }) : super(key: key);

  @override
  State<MyListMessage> createState() => _MyListMessageState();
}

class _MyListMessageState extends State<MyListMessage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        height: 50,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhiteColor,
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
                    style: widget.rightSecStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
