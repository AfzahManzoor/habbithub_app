import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyCusCard extends StatelessWidget {
  final String title;
  final Widget leading;
  // final Widget trailing;

  final Color color;
  const MyCusCard({
    super.key,
    required this.title,
    required this.leading,
    required this.color,
    // required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(
              height: 60,
              width: 393,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                tileColor: color,
                leading: leading,
                // trailing: widget.trailing,
                title: Text(
                  title,
                  style: tileStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
