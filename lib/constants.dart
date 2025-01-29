import 'package:flutter/material.dart';

const kPrimaryColor = Colors.black;
const btnStyle = TextStyle(
  fontSize: 18,
  fontFamily: 'Poppins-Bold',
  fontWeight: FontWeight.w300,
  color: Colors.black,
);
const tileStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
const mtileStyle = TextStyle(
  color: Colors.black,
  fontSize: 14,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
const sbtStyle = TextStyle(
  color: Colors.black,
  fontSize: 10,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
const box = SizedBox(
  height: 20,
);
void nextScreenReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}
