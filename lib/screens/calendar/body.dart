import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbithub_app/constants.dart';
import 'package:habbithub_app/screens/calendar/components/calendar.dart';

import '../../widgets/my_button.dart';
import '../Home/components/card.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDE0FE),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: Text('Calendar', style: mtileStyle),
            ),
            const SizedBox(
              height: 10,
            ),
            const MyCalendar(),
            const SizedBox(
              height: 12,
            ),
            const Text('   February, 15th, Thu', style: tileStyle),
            const SizedBox(
              height: 10,
            ),
            const MyCusCard(
              title: 'Read',
              leading: Icon(CupertinoIcons.book),
              color: Color(0xFFD7ECFE),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('   February, 16th, Fri', style: tileStyle),
            const SizedBox(
              height: 10,
            ),
            const MyCusCard(
              title: 'Read',
              leading: Icon(CupertinoIcons.book),
              color: Color(0xFFD7ECFE),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('   This week', style: tileStyle),
            const SizedBox(
              height: 10,
            ),
            const MyCusCard(
              title: 'Read',
              leading: Icon(CupertinoIcons.book),
              color: Color(0xFFD7ECFE),
            ),
            const SizedBox(
              height: 10,
            ),
            const MyCusCard(
              title: 'Read',
              leading: Icon(CupertinoIcons.book),
              color: Color(0xFFD7ECFE),
            ),
            const SizedBox(
              height: 10,
            ),
            MyCBtton(text: '', onTap: () {})
          ],
        ),
      ),
    );
  }
}
