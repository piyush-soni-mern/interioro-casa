// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:interioro/pages/auth/createacc.dart';
import 'package:interioro/pages/auth/loginscr.dart';
import 'package:interioro/pages/auth/methods.dart';
import 'package:interioro/pages/home.dart';
import 'package:interioro/pages/auth/loginscr.dart';
import 'package:interioro/pages/auth/createacc.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/login': (context) => LoginScreen(),
      '/createaccount': (context) => CreateAccount(),
      //'/login': (context) => Login_Page(),
      //'/register': (context) => register(),
    },
  ));
}
