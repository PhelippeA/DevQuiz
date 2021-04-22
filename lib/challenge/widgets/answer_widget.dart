import 'package:flutter/material.dart';
import 'package:quiz_nlw5/core/core.dart';

class AnswerWigdet extends StatelessWidget {
  final String titulo;
  bool isRight;
  bool isSelected;

  AnswerWigdet({
    Key? key,
    required this.titulo,
    this.isRight = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight =>
      isRight ? Icons.check : Icons.error_outline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? _selectedColorCardRight : AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(
            color: isSelected ? _selectedColorBorderCardRight : AppColors.border,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              titulo,
              style: isSelected ? _selectedTextStyleRight : AppTextStyles.body,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorRight : AppColors.white,
              borderRadius: BorderRadius.circular(500),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedBorderRight : AppColors.border,
                ),
              ),
            ),
            child: isSelected
                ? Icon(
                    _selectedIconRight,
                    size: 16,
                  )
                : null,
          )
        ],
      ),
    );
  }
}
