import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
   HomePage({super.key});
  final user=FirebaseAuth.instance.currentUser;
  void logOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon:Icon(Icons.logout), onPressed: () { logOut(); },)
        ],
      ),
      body: Center(child: Text('Logged In as ' + user!.email!)),
    );
  }
}