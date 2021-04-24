import 'package:flutter/material.dart';
import 'package:quiz_nlw5/core/core.dart';
import 'package:quiz_nlw5/shared/widgets/progress_indicator/linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPageNumber;
  final int totalPages;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPageNumber,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão $currentPageNumber',
                style: AppTextStyles.body,
              ),
              Text(
                'de $totalPages',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          LinearProgressIndicatorWidget(
            value: currentPageNumber / totalPages,
          )
        ],
      ),
    );
  }
}
