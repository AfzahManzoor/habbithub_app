// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import 'package:habbithub_app/display.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 222, 249),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text('Sign Up',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                buildTextFormField(nameController, 'Name', Icons.person,
                    'Please enter username'),
                const SizedBox(height: 20),
                buildTextFormField(emailController, 'Email', Icons.email,
                    'Please enter your email', validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                buildTextFormField(passwordController, 'Password',
                    Icons.password, 'Please enter your password',
                    obscureText: true, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password cannot be less than 6 characters';
                  }
                  return null;
                }),
                const SizedBox(height: 20),
                buildTextFormField(cpasswordController, 'Confirm Password',
                    Icons.password, 'Please confirm your password',
                    obscureText: true, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                }),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signupwithFirebase(context); // Call the signup method
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        // Navigate to Sign In page
                      },
                      child: const Text("Sign In",
                          style: TextStyle(color: Colors.purple)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(TextEditingController controller, String labelText,
      IconData icon, String errorText,
      {bool obscureText = false, String? Function(String?)? validator}) {
    return Container(
      width: 390,
      height: 60,
      decoration: ShapeDecoration(
        color: const Color(0xFFFDFDFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color.fromARGB(255, 227, 222, 249)),
          border: InputBorder.none,
          labelText: labelText,
        ),
        validator: validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return errorText;
              }
              return null;
            },
      ),
    );
  }

  Future<Position> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw Exception("Location permissions are denied");
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> signupwithFirebase(BuildContext context) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final User? user = userCredential.user;
      final Position position = await getLocation();

      await FirebaseFirestore.instance.collection('users').doc(user?.uid).set({
        'email': emailController.text,
        'created_at': DateTime.now(),
        'latitude': position.latitude,
        'longitude': position.longitude,
      });

      print("Successfully signed up: ${user?.email}");

      // Navigate to UserLocationPage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserLocationPage()),
      );
    } catch (e) {
      print("Sign-up failed: ${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign-up failed: ${e.toString()}"),
      ));
    }
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/button.dart';
// import '../Login/body.dart';
// import 'components/text.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();

//   String? email;
//   String? password;
//   String? confirmPassword;
//   String? name;

//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController cpasswordController = TextEditingController();
//   final _auth = FirebaseAuth.instance;
//   // User? fireBaseuser;
//   // final DatabaseReference userRefernece =
//   //     FirebaseDatabase.instance.ref().child('Users');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 227, 222, 249),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const MyyText(),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Container(
//                   width: 390,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFFDFDFD),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: TextFormField(
//                     onChanged: (val) {
//                       setState(() {
//                         name = val;
//                       });
//                     },
//                     controller: nameController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.person,
//                         color: Color.fromARGB(255, 227, 222, 249),
//                       ),
//                       border: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       labelText: ' Name',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter username';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   width: 390,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFFDFDFD),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: TextFormField(
//                     onChanged: (val) {
//                       setState(() {
//                         email = val;
//                       });
//                     },
//                     controller: emailController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.email,
//                         color: Color.fromARGB(255, 227, 222, 249),
//                       ),
//                       border: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       labelText: ' Email',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                         return 'Please enter a valid email';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   width: 390,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFFDFDFD),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: TextFormField(
//                     onChanged: (val) {
//                       setState(() {
//                         password = val;
//                       });
//                     },
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.password,
//                         color: Color.fromARGB(255, 227, 222, 249),
//                       ),
//                       border: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       labelText: ' Password',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password can not less then 5 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   width: 390,
//                   height: 60,
//                   decoration: ShapeDecoration(
//                     color: const Color(0xFFFDFDFD),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: TextFormField(
//                     obscureText: true,
//                     controller: cpasswordController,
//                     decoration: const InputDecoration(
//                       prefixIcon: Icon(
//                         Icons.password,
//                         color: Color.fromARGB(255, 227, 222, 249),
//                       ),
//                       border: InputBorder.none,
//                       disabledBorder: InputBorder.none,
//                       labelText: ' Confirm Password',
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please confirm your password';
//                       }
//                       if (value != passwordController.text) {
//                         return 'Passwords do not match';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 80,
//                 ),
//                 CustomButton(
//                     text: 'Sign Up',
//                     onTap: () {
//                       signupwithFirebase(context);
//                       if (_formKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const LoginScreen()),
//                         );
//                       }
//                     }),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text('Already have an account?'),
//                     TextButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoginScreen()),
//                           );
//                         },
//                         child: const Text(
//                           "Sign In",
//                           style: TextStyle(color: Colors.purple),
//                         ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   signupwithFirebase(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       try {
//         final UserCredential userCredential =
//             await _auth.createUserWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );

//         // Successfully signed up
//         final User? user = userCredential.user;
//         await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user?.uid)
//             .set({
//           'email': emailController.text,
//           'created_at': DateTime.now(),
//           // Add other user details here if needed
//         });

//         if (kDebugMode) {
//           print("Successfully signed up: ${user?.email}");
//         }

//         return user;
//       } catch (e) {
//         if (kDebugMode) {
//           print("Sign-up failed: ${e.toString()}");
//         }

//         // Show a snackbar or other user-friendly error message
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Sign-up failed: ${e.toString()}"),
//         ));
//       }
//     }
//   }
// }
