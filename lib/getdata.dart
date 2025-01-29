import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, dynamic>?> getUserLocationData(String userId) async {
  DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();

  if (snapshot.exists) {
    return snapshot.data();
  } else {
    return null;
  }
}
