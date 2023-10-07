import 'package:flutter/material.dart';
import 'package:todo_app/pages/login_screen.dart';
import 'package:todo_app/pages/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //if showLoginPage is true then show login page else show register page
  bool showLoginPage=true;
//togglepage function will toggle the value of showLoginPage
//this simply means on clicking register now button the value of showLoginPage will be changed to false and hence register page will be shown instead of login page
  void togglepage(){
    setState(() {
      showLoginPage=!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginScreen(onTap:togglepage);
    }
    else{
      return RegisterScreen(onTap: togglepage);
    }
  }
}