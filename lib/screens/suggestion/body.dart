import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../Home/home_page.dart';
import 'components/card.dart';
import 'components/list_tile.dart';

class MySuggestion extends StatefulWidget {
  const MySuggestion({super.key});

  @override
  State<MySuggestion> createState() => _MySuggestionState();
}

class _MySuggestionState extends State<MySuggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              // top: 13,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Suggestions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                MyTile(
                  title: 'Learn and study more',
                  subtitle: 'Stay hungry for knowledge',
                  leading: Image.asset('assets/images/l1.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyCard(
                  title: 'Read',
                  leading: Icon(CupertinoIcons.book),
                  color: Color(0x99FFEE93),
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyCard(
                  title: 'Study',
                  leading: Icon(CupertinoIcons.pencil),
                  color: Color(0x99ADF7B6),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTile(
                  title: 'Exercise',
                  subtitle: 'Become your best version',
                  leading: Image.asset('assets/images/l2.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyCard(
                  title: 'Running',
                  leading: Image.asset('assets/images/run.png'),
                  color: const Color(0x99BDE0FE),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyCard(
                  title: 'Cycling',
                  leading: Image.asset('assets/images/cycle.png'),
                  color: const Color(0x99FFC09F),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTile(
                  title: 'Clean and Organize',
                  subtitle: 'Get you life togheter',
                  leading: Image.asset('assets/images/brush.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyCard(
                  title: 'Mop the house',
                  leading: Image.asset('assets/images/bin.png'),
                  color: const Color(0x99FCF5C7),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyCard(
                  title: 'Clean the bathroom',
                  leading: Image.asset('assets/images/wash.png'),
                  color: const Color(0x99F3C4FB),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: CustomButton(
                    text: 'Add more',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
