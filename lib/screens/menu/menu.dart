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
  final _suggestions = <String>["login", "register", "about", "contact"];
  final _biggerFont = const TextStyle(fontSize: 18);
  // #enddocregion RWS-var

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    // #docregion itemBuilder
    return ListView.builder(
      itemCount: _suggestions.length,
      padding: const EdgeInsets.all(16.0),
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
    );
  }
}
