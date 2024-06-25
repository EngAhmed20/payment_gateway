import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  const customButton( {super.key,this.onTap,this.isLoading=false, required this.text});
  final void Function()? onTap;
  final bool isLoading;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
        child: Center(
          child:isLoading==true?const SizedBox(height: 25,width: 25,
              child: CircularProgressIndicator(color: Colors.white,)): Text(text,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
