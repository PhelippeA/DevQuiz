import 'package:flutter/material.dart';
import 'package:quiz_nlw5/challenge/views/challenge_screen.dart';
import 'home/views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

