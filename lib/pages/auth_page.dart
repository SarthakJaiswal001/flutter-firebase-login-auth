import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/login_or_register.dart';
import 'package:todo_app/pages/login_screen.dart';
import 'package:todo_app/pages/home_page.dart';
//this page is created to check if the user is already signed in or not if not signed in then redirect to login page and if signed in then to home page
//to decide whether we will go to signin page or the home page
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  @override
  Widget build(context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),//stream will continously listen firebase auth changes whether user is loggedin or not
          builder: (context, snapshot) {
            if (snapshot.hasData) {//user is loggged in, if snapshot has data then go to homepage 
              return HomePage();
            } else {//user is not logged in, snapshot has no data so go to loginpage
              return const LoginOrRegister();
            }
          },
        ),
        );
  }
}
