import 'package:flutter/material.dart';
import 'package:interioro_casa/screens/auth/login.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return const RandomWords();
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <String>["Login", "Register", "About Us", "Contact Us"];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          )
        ),
      child: ListView.builder(
        itemCount: _suggestions.length,
        padding: const EdgeInsets.all(16.0),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              if (i == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }
            },
            title: Text(
              _suggestions[i],
              style: _biggerFont,
            ),
          );
        },
      ),
    );
  }
}
