import 'package:flutter/material.dart';

class LetsBegin extends StatefulWidget {
  const LetsBegin({Key? key}) : super(key: key);

  @override
  State<LetsBegin> createState() => _LetsBeginState();
}

class _LetsBeginState extends State<LetsBegin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Colors.pink,
            offset: Offset(0.0,0.0),
            spreadRadius: 0.0,
            // blurStyle: BlurStyle.inner,
          )
        ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[Text("Let's begin soon",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)],
      ),
    );
  }
}