import 'package:flutter/material.dart';
import 'package:quiz_nlw5/core/core.dart';

class LinearProgressIndicatorWidget extends StatelessWidget {
  final value;

  const LinearProgressIndicatorWidget({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        value: 0.3,
        backgroundColor: AppColors.chartSecondary,
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.chartPrimary,
        ),
      ),
    );
  }
}
