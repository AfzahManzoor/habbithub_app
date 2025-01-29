// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/calendar_view.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_container.dart';
import '../suggestion/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF5F5F5),
          width: 430,
          height: 932,
          child: Column(
            children: [
              const MyCalendarView(),
              const SizedBox(
                height: 20,
              ),
              const MyCustomContainer(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 250,
                child: Center(child: Image.asset('assets/images/bg2.png')),
              ),
              MyCBtton(
                text: '',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MySuggestion()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
