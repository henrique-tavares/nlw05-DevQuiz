import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz;
  final VoidCallback onTap;

  const QuizCardWidget({Key? key, required this.quiz, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset(quiz.icon),
              ),
              Text(
                quiz.title,
                style: AppTextStyles.heading15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${quiz.correctAnswers} de ${quiz.questions.length}",
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ProgressIndicatorWidget(
                      value: quiz.correctAnswers / quiz.questions.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
