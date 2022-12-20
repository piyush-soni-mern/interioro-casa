import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/categorybuilder.dart';

class DesignIdeas extends StatelessWidget {
  const DesignIdeas({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        thickness: 8.0,
        thumbVisibility: true,
        thumbColor: Colors.purple,
        radius: const Radius.circular(10.0),

        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Text(
                  'Design Ideas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
                  
                const SizedBox(height: 10.0 ),
                      
                const Text(
                  'Check out how your dream home can look like. Get inspiration from interiorcasa\'s ',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
                  
                const SizedBox(height: 16.0,),
                  
                const Divider(
                  thickness: 1.0,
                  color: Colors.black54,
                ),
            
                CategoryBuilder(),
              ],),
          ),
        ),
      );
  }
}