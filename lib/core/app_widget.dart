import 'package:flutter/material.dart';
import 'package:quiz_nlw5/home/views/home_screen.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
