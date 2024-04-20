import 'package:flutter/material.dart';

// App Bar
const kAppbarBg = Color.fromRGBO(34, 72, 158, 1);

const kAppbarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(25),
    bottomRight: Radius.circular(25),
  ),
);

const kListBoxDecoration = BoxDecoration(
  color: Color.fromRGBO(189, 205, 234, 1),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(7),
    bottomLeft: Radius.circular(7),
  ),
);

const kSkyBlueColor = Color.fromRGBO(189, 205, 234, 1);

const kWhiteColor = Color.fromRGBO(245, 245, 245, 1);

const kNewReportHeadTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const kReportTextStyle = TextStyle(fontSize: 16);

const kHomePageSizedBox = SizedBox(height: 20);

const kHomePageSmlSizedBox = SizedBox(height: 5);
