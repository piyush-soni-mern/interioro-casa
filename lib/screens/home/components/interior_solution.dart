import 'package:flutter/material.dart';

class InteriorSolution extends StatelessWidget {
  const InteriorSolution({
    Key? key,
    required this.img, 
    required this.title, 
    required this.description,
  }) : super(key: key);
  final String img;
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 20, 16, 10),
      width: size.width*0.5,
      height: 240,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius:10.0,
              offset: Offset(5.0,5.0),
              color: Color.fromARGB(115, 177, 177, 177),
              spreadRadius: 2.0,
            ),
            BoxShadow(
              blurRadius:0.0,
              offset: Offset(0.0,0.0),
              color: Colors.white,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),

      child: Column(
          children: [                                
            Image.asset(img,width:size.width*0.5,height: 120,fit: BoxFit.cover,),
            Text(title,style: const TextStyle(fontWeight: FontWeight.bold),),
            Text(description,overflow: TextOverflow.ellipsis,maxLines: 5,),
          ],
        ),
    );
  }
}