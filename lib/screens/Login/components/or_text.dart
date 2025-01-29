import 'package:flutter/material.dart';

class MYDivider extends StatelessWidget {
  const MYDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 70,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              indent: 20.0,
              endIndent: 10.0,
              color: Color.fromARGB(255, 61, 60, 60),
            ),
          ),
          Text(
            'OR',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w900,
            ),
          ),
          Expanded(
            child: Divider(
              color: Color.fromARGB(255, 61, 60, 60),
              indent: 10.0,
              endIndent: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
