import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  AnswerWidget({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  Color get _selectedColor => answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorder => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCard => answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCard => answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyle =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIcon => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? () {} : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCard : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: isSelected ? _selectedBorderCard : AppColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  answer.title,
                  style: isSelected ? _selectedTextStyle : AppTextStyles.body,
                ),
              ),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedColor : AppColors.white,
                  border: Border.all(color: isSelected ? _selectedBorder : AppColors.border),
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
      ),
    );
  }
}
