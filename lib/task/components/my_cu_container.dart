import 'package:flutter/material.dart';

import '../../constants.dart';

class MyNewContainer extends StatelessWidget {
  const MyNewContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 60,
          decoration: ShapeDecoration(
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
                labelText: '  Name your new task', labelStyle: sbtStyle),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 60,
          decoration: ShapeDecoration(
            color: const Color(0xFFFDFDFD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
                labelText: '  Describe it', labelStyle: sbtStyle),
          ),
        ),
      ],
    );
  }
}
