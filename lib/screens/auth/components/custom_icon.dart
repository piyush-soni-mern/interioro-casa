import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  const CustomIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, right: 16.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(0.4),
        color: const Color(0xff2b343c),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
