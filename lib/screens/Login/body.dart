import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:habbithub_app/screens/signup/signup.dart';

import '../../widgets/button.dart';
import '../Welcome/components/icons.dart';

import '../contract/contract.dart';
import 'components/or_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email, password;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 222, 249),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Log in to HabitHUB',
                  style: TextStyle(
                    color: Color(0xFFC67ED2),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const MyText(),
                const SizedBox(
                  height: 20,
                ),
                const CustomIcon(),
                const MYDivider(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 390,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                    controller: emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 227, 222, 249),
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: ' Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 390,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFDFDFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 227, 222, 249),
                      ),
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: ' Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 5) {
                        return 'Password can not less then 5 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dont have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.purple),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'Login',
                  onTap: () {
                    loginwithFirebase();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkAuthentication() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
        }
      }
    });
  }

  loginwithFirebase() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        final User? user = userCredential.user;
        if (kDebugMode) {
          print("Successfully logged in: ${user?.email}");
        }
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ContractScreen()));
        // replace HomePage with your target page ); return user;
      } catch (e) {
        if (kDebugMode) {
          print("Login failed: $e");
        }
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Login failed: ${e.toString()}"),
        ));
      }
    }
  }
}

class MyText extends StatelessWidget {
  const MyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      maxLines: 2,
      'Welcome back! Sign in using your social \n account or email to continue us',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFF1C2120),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        letterSpacing: 0.10,
      ),
    );
  }
}
