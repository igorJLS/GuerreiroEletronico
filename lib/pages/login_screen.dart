import 'package:flutter/material.dart';
import 'package:tcc/components/auth_form.dart';
import 'package:tcc/pages/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.3, 1],
            colors: [
              Color.fromARGB(250, 253, 253, 253),
              Color.fromARGB(234, 24, 15, 15),
            ],
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: Image.asset("lib/assets/images/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthForm(),
          ],
        ),
      ),
    );
  }
}
