import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/productbuilder.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(
      {Key? key,
      required this.title,
      required this.titledesc,
      required this.category
      })
      : super(key: key);

  final String title;
  final String titledesc;
  final String category;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              titledesc,
              style: TextStyle(
                color: Colors.blueGrey[300],
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ProductBuilder(
              category: category,
            ),
          ],
        ),
      ),
    );
  }
}
