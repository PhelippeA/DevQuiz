import 'package:flutter/material.dart';
import 'package:quiz_nlw5/challenge/widgets/answer_widget.dart';
import 'package:quiz_nlw5/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String titulo;

  const QuizWidget({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            titulo,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWigdet(
            isRight: false,
            isSelected: true,
            titulo: "Possibilita a criação de apps compilados nativamente",
          )
        ],
      ),
    );
  }
}
