import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyTilee extends StatelessWidget {
  final String title;
  // final Widget leading;
  final Widget trailing;

  final Color color;
  const MyTilee({
    super.key,
    required this.title,
    // required this.leading,
    required this.color,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: color,
        // leading: leading,
        trailing: trailing,
        title: Text(
          title,
          style: mtileStyle,
        ),
      ),
    );
  }
}
