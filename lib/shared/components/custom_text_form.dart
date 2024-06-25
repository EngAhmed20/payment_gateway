import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defaulttextform(
    {required TextEditingController controller,
      Function(String)? onSubmit,
      TextInputType? keyboardType,
      Function(String)? onChange,
      VoidCallback? ontap,
      required String? Function(String?)? validator,
      String? label,
      TextAlign align=TextAlign.start,
      String? hint,
      IconData? preficon,
      VoidCallback? sufixpress,
      bool ispass = false,
      IconData? suficon,
      bool isCleckable = true,
      bool read_only = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textDirection: TextDirection.ltr,
      enabled: isCleckable,
      obscureText: ispass,
      onChanged: onChange,
      readOnly: read_only,
      onTap: ontap,
      textAlign:align ,
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
       // label: Text(label??''),
        hintText: hint,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(preficon),
        suffixIcon: IconButton(onPressed: sufixpress, icon: Icon(suficon)),
      ),
      validator: validator,
    );
