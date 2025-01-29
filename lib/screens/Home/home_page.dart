import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habbithub_app/screens/Home/components/card.dart';

import '../../task/components/new_task.dart';
import '../../widgets/calendar_view.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SizedBox(
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
            const MyCusCard(
              title: 'Read',
              leading: Icon(CupertinoIcons.book),
              color: Color(0x99FFEE93),
            ),
            const SizedBox(
              height: 20,
            ),
            const MyCusCard(
              title: 'Study',
              leading: Icon(CupertinoIcons.pencil),
              color: Color(0x99ADF7B6),
            ),
            const SizedBox(
              height: 20,
            ),
            MyCusCard(
              title: 'Mop the house',
              leading: Image.asset('assets/images/bin.png'),
              color: const Color(0x99F3C4FB),
            ),
            const SizedBox(
              height: 20,
            ),
            MyCBtton(
              text: '',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TaskPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
