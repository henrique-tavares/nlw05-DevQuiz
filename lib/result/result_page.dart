import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int correctAnswers;
  final int totalQuestions;

  const ResultPage(
      {Key? key, required this.title, required this.correctAnswers, required this.totalQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(AppImages.trophy),
                  SizedBox(
                    height: 48,
                  ),
                  Text('Parabéns!', style: AppTextStyles.heading40),
                  SizedBox(
                    height: 24,
                  ),
                  Text.rich(
                    TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(text: "\n$title", style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\ncom $correctAnswers de $totalQuestions acertos",
                            style: AppTextStyles.body),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "DevQuiz - Resultado do quiz: $title com ${(correctAnswers / totalQuestions * 100).toInt()}% de aproveitamento.");
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.transparent(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
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
