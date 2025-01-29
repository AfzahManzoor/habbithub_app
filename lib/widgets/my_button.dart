// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MyCBtton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyCBtton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              onTap();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      offset: const Offset(0, 3),
                      blurRadius: 5,
                    ),
                  ],
                  color: const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: Colors.black,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
