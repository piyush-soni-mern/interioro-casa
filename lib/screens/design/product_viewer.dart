import 'package:flutter/material.dart';

class Productviewer extends StatelessWidget {
  const Productviewer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [ BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
            ]
          ),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        
        const SizedBox(
          height: 10.0,
        ),

        Stack(
          children: [
            Image.asset(
              'assets/scene.jpg',
              height: 240.0,
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent) ,
                  shape: BoxShape.circle,
                  // image: DecorationImage(
                  //   fit: BoxFit.fill,
                  //   image: AssetImage("assets/scene.jpg"),
                  // )
                ),
              )
            ),
          ],
        )

      ],)
    );
  }
}