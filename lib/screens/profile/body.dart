import 'package:flutter/material.dart';

import '../Login/body.dart';
import 'components/my_tile.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF4D8F9),
      body: SizedBox(
        height: 932,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              MyText(),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                title: 'Account',
                color: Color(0xFFFDFDFD),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                  title: 'Notifications',
                  color: Color(0xFFFDFDFD),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                  title: 'Help',
                  color: Color(0xFFFDFDFD),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                  title: 'Storage and Data',
                  color: Color(0xFFFDFDFD),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                  title: 'Invite a friend',
                  color: Color(0xFFFDFDFD),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
              SizedBox(
                height: 20,
              ),
              MyTilee(
                  title: 'Logout',
                  color: Color(0xFFFDFDFD),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
