// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'screens/Home/body.dart';
import 'screens/Home/home_page.dart';
import 'screens/calendar/body.dart';
import 'screens/profile/body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x99F3C4FB),
      ),
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: Navigator(
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: Navigator(
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const CalendarPage(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: Navigator(
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: Navigator(
              onGenerateRoute: (route) => MaterialPageRoute(
                builder: (context) => const MyProfile(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: 430,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                offset: const Offset(0, 3),
                blurRadius: 8,
              ),
            ],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  30,
                ),
                topRight: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                30,
              ),
              topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 20,
            backgroundColor: const Color(0xFFF5F5F5),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xCCBA68C8),
            onTap: _onItemTapped,
            unselectedItemColor: Colors.black.withOpacity(0.800000011920929),
          ),
        ),
      ),
    );
  }
}
