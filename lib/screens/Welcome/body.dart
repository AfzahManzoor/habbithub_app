import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../Login/body.dart';
import 'components/icons.dart';
import 'components/text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 231, 186, 201),
            Color.fromARGB(255, 119, 195, 214),
          ], begin: Alignment.centerLeft, end: Alignment.topRight),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            const TextWidget(),
            const SizedBox(
              height: 100,
            ),
            CustomButton(
              text: 'Login',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            const SizedBox(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      color: Color.fromARGB(255, 61, 60, 60),
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Color.fromARGB(255, 61, 60, 60),
                      indent: 10.0,
                      endIndent: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            const CustomIcon()
          ],
        ),
      ),
    );
  }
}
