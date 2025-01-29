import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLocationPage extends StatefulWidget {
  const UserLocationPage({super.key});

  @override
  _UserLocationPageState createState() => _UserLocationPageState();
}

class _UserLocationPageState extends State<UserLocationPage> {
  Map<String, dynamic>? locationData;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _fetchLocationData();
  }

  Future<void> _fetchLocationData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      Map<String, dynamic>? data = await getUserLocationData(user.uid);
      setState(() {
        locationData = data;
      });
    }
  }

  Future<Map<String, dynamic>?> getUserLocationData(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    if (snapshot.exists) {
      return snapshot.data();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Location Data'),
      ),
      body: Center(
        child: locationData == null
            ? const Text('No location data found.')
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Latitude: ${locationData!['latitude']}'),
                  Text('Longitude: ${locationData!['longitude']}'),
                  Text('Created At: ${locationData!['created_at'].toDate()}'),
                ],
              ),
      ),
    );
  }
}
