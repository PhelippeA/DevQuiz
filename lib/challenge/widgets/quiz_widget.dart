import 'package:flutter/material.dart';

import 'package:quiz_nlw5/challenge/widgets/answer_widget.dart';
import 'package:quiz_nlw5/core/app_text_styles.dart';
import 'package:quiz_nlw5/shared/models/answer_model.dart';
import 'package:quiz_nlw5/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 38),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (int i = 0; i < widget.question.answers.length; i++)
            AnswerWigdet(
              answer: answer(i),
              disabled: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: () {
                indexSelected = i;
                widget.onChange();
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then(
                  (value) => widget.onChange(),
                );
              },
            ),
          SizedBox(height: 18)
        ],
      ),
    );
  }
}
