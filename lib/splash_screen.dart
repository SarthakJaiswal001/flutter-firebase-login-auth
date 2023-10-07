import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/pages/auth_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return AuthPage();
      }));
    });
  }

  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Text(
          'Notes Only',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}
