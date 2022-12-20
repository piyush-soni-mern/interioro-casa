import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/home/components/best_solution.dart';
import 'package:interioro_casa/screens/home/components/top_carousel.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: const[
        TopCarousel(),
        BestSolution(),
      ]),
    );
  }
}