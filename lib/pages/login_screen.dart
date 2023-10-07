//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/my_button.dart';
import 'package:todo_app/components/my_text_field.dart';
import 'package:todo_app/components/square_tile.dart';
import 'package:todo_app/services/auth_services.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;
  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
        //this will show a loading circlee
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //  if (e.code == 'user-not-found') {
      //   userNotFound();
      // } else if (e.code == 'wrong-password') {
      //   wrongPassword();
      // }
      showErrorMessage(e.code);
    }
    Navigator.pop(context);
  }

  void userNotFound() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('User Not Found'),
          );
        });
  }

  void wrongPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Password'),
          );
        });
  }

  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(message),
          );
        });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.note,
                  size: 150,
                ),
                const SizedBox(
                  height: 60,
                )

                //welcome back, you'have been missed
                ,
                const Text(
                  'Welcome Back! You\'ve been missed.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 52, 50, 50),
                      fontWeight: FontWeight.bold),
                ),
                //username textfield
                const SizedBox(
                  height: 40,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Username or Email',
                    abscureText: false),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    abscureText: true),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 83, 81, 81)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue With',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'assets/images/google.png',
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SquareTile(
                      imagePath: 'assets/images/apple.png',
                      onTap: () => {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a Member',
                      style: TextStyle(color: Color.fromARGB(255, 94, 92, 92)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )

                //password textfield

                //forgot password

                //signin button

                //or continue with

                //google + apple sign in button

                //not a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
