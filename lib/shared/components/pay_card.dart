import 'package:flutter/material.dart';

Widget payCard({
  void Function()? onTap,
  required String img,
  required String title,

})=>InkWell(
  onTap:onTap ,
  child: Card(
    color: Colors.blue,
    elevation: 15,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Image.asset(img,height: 220,width: double.infinity,),
        Text(title,style: TextStyle(fontSize:20,fontWeight: FontWeight.w500),)
      ],

    ),
  ),
);