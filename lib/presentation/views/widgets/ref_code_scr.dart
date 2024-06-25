import 'package:flutter/material.dart';
import 'package:payment_gateway/shared/components/constants.dart';

class RefCodeScr extends StatelessWidget {
  const RefCodeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(' You Should Go to any market to pay',style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            mySizedBox(height: 10),
           const  Text(' This is The Refrence code',style: TextStyle(fontSize: 18),),
            mySizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: Card(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 25,
                child: Text(RefCode,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign:TextAlign.center,),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
