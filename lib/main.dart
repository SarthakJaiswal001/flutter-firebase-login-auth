import 'package:flutter/material.dart';
import 'package:todo_app/pages/auth_page.dart';
import 'package:todo_app/pages/login_screen.dart';
import 'package:todo_app/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      home:
          SplashScreen(), //this will simply fireup the auth page and check if user is already loggedin or not through stream and will go to that page(either login screen or homepage)
    );
  }
}
