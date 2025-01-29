import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 150,
        height: 55,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                offset: const Offset(0, 3),
                blurRadius: 5,
              ),
            ],
            color: const Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text(text, style: btnStyle)),
      ),
    );
  }
}
