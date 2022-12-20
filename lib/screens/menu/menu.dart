import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
        children: const[Text("Menu Coming Soon",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)],
      ),
    );
  }
}