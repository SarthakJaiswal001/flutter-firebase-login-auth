import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key,required this.onTap,required this.text});
  final  Function()? onTap;
  final String text;

  Widget build(context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:20,horizontal: 80),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child:  Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
