import 'package:flutter/material.dart';
import 'package:quiz_nlw5/challenge/widgets/question_indicator_widget.dart';
import 'package:quiz_nlw5/challenge/widgets/quiz_widget.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(titulo: "O que o Flutter faz em sua totalidade ?"),
    );
  }
}
