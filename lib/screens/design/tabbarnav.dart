import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/design/productpage.dart';

class Productsview extends StatefulWidget {
  final int selectedtabindex;
  final String category;

  const Productsview(
      {Key? key, required this.selectedtabindex, required this.category})
      : super(key: key);

  @override
  State<Productsview> createState() => _ProductsviewState();
}

class _ProductsviewState extends State<Productsview>
    with SingleTickerProviderStateMixin {
  _ProductsviewState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ProductPage(
                title: widget.category + ' Interior Designs',
                titledesc: 'Check out products at InteriorCasa\'s',
              ),
            )
          ],
        ),
      ),
    );
  }
}
