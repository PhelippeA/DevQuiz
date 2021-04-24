import 'package:flutter/material.dart';
import 'package:quiz_nlw5/core/core.dart';
import 'package:quiz_nlw5/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int totalQuestions;
  final int totalAnswered;
  final VoidCallback onTap;

  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.totalQuestions,
      required this.totalAnswered,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(AppImages.blocks),
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: AppTextStyles.body20,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      '$totalAnswered/$totalQuestions',
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: LinearProgressIndicatorWidget(
                      value: totalAnswered / totalQuestions,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
