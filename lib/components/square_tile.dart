import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget{
  const SquareTile({super.key,required this.imagePath,required this.onTap});
  final Function()? onTap;
  final String imagePath;
  @override
  Widget build(context){
    return GestureDetector(
      onTap: () => onTap,
      child: Container(padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
    
    
      ),
      child: Image.asset(imagePath,height: 40,),),
    );
  }
}