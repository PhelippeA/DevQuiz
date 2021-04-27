import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_nlw5/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backGroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color tapColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backGroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
    required this.tapColor,
  }) : super(key: key);

  NextButtonWidget.colored({required this.label, required this.onTap, required this.backGroundColor})
      : this.fontColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.tapColor = AppColors.grey;

  NextButtonWidget.white({required this.label, required this.onTap})
      : this.backGroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.tapColor = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: AppColors.border),
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
