import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String title;
  final bool isRight;
  final bool isSelected;

  AnswerWidget(
      {Key? key,
      required this.title,
      this.isRight = false,
      this.isSelected = false})
      : super(key: key);

  Color get _selectedColor => isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorder =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCard =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCard => isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyle =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIcon => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCard : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: isSelected ? _selectedBorderCard : AppColors.border),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: isSelected ? _selectedTextStyle : AppTextStyles.body,
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColor : AppColors.white,
                border: Border.all(
                    color: isSelected ? _selectedBorder : AppColors.border),
                borderRadius: BorderRadius.circular(24),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIcon,
                      size: 16,
                      color: AppColors.white,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
