import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 390,
            height: 60,
            decoration: ShapeDecoration(
              color: const Color(0xFFFDFDFD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 227, 222, 249),
                ),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                labelText: ' Email',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 390,
            height: 60,
            decoration: ShapeDecoration(
              color: const Color(0xFFFDFDFD),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.password,
                  color: Color.fromARGB(255, 227, 222, 249),
                ),
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                labelText: ' Password',
              ),
            ),
          ),
          const SizedBox(
            height: 160,
          ),
        ],
      ),
    );
  }
}
