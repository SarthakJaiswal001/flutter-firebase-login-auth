import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.abscureText});
  final controller; //this will store thee data which will be filled in the textfield
  final String hintText;
  final bool abscureText;
  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: abscureText, //this hides the password when it is written
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Color.fromARGB(255, 7, 7, 7))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 254, 254))),
            fillColor: Color.fromARGB(255, 236, 232, 232),
            filled: true,
            hintText:
                hintText, //this text will give hint to user what has to be written
            hintStyle: TextStyle(color: Color.fromARGB(255, 123, 122, 122))),
      ),
    );
  }
}
