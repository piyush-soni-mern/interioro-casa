import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/let_begin/ar_product_builder.dart';

class LetsBegin extends StatefulWidget {
  const LetsBegin({Key? key}) : super(key: key);

  @override
  State<LetsBegin> createState() => _LetsBeginState();
}

class _LetsBeginState extends State<LetsBegin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const[
            ArProductBuidler(),
          ],
        ),
      ),
    );
  }
}