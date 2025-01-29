import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maxLines: 4,
            'Do your \ntasks\nquickly\nand easy',
            style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Your tasks, your rules, our support',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
