import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/home/components/interior_solution.dart';


class BestSolution extends StatelessWidget {
  const BestSolution({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          const Text("Best solution for all home interiors",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("Whether it's a kitchen or your beloved home, we make it most beloved for you.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: const[
                    InteriorSolution(
                      title: "Home Interior",
                      description: "The interior of the house is focused around a large.",
                      img: "assets/images/home2.jpg",
                    ),
                    InteriorSolution(
                      img: "assets/images/home.jpg", 
                      title: "Home Interior", 
                      description: "The interior of the house is focused around a large The interior",
                    ),
                    InteriorSolution( 
                      img: "assets/images/home.jpg", 
                      title: "Home Interior", 
                      description: "The interior of the house is focused around a large The interior",
                    ),
                    InteriorSolution( 
                      img: "assets/images/home.jpg", 
                      title: "Home Interior", 
                      description: "The interior of the house is focused around a large The interior",
                    )
                ],
            ),
          ),
        ],
      ),
    );
  }
}