import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget leading;

  const MyTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SizedBox(
            height: 60,
            child: ListTile(
              leading: leading,
              title: Text(
                title,
                style: tileStyle,
              ),
              subtitle: Text(
                subtitle,
                style: sbtStyle,
              ),
            ),
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          label: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
            size: 15,
          ),
          icon: const Text(
            'See all',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
