import 'package:flutter/material.dart';

class Magazine extends StatefulWidget {
  const Magazine({Key? key}) : super(key: key);

  @override
  State<Magazine> createState() => _MagazineState();
}

class _MagazineState extends State<Magazine> {
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
        children: const[
          Text(
            "Magazine Under Development",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          ),
          Text(
            "Developing by :- Piyush Soni",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}