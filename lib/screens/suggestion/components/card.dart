import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyCard extends StatelessWidget {
  final String title;
  final Widget leading;

  final Color color;
  const MyCard({
    super.key,
    required this.title,
    required this.leading,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SizedBox(
            height: 60,
            // width: 500,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              tileColor: color,
              leading: leading,
              title: Text(
                title,
                style: tileStyle,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const CircleAvatar(
            backgroundColor: Color(0xFFD9D9D9), child: Icon(Icons.add)),
      ],
    );
  }
}
