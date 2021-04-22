import 'package:dev_quiz/challenge/challenge_controller.dart';
import 'package:dev_quiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final QuizModel quiz;

  const ChallengePage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          top: true,
          child: ValueListenableBuilder<int>(
            valueListenable: challengeController.currentQuestionNotifier,
            builder: (context, value, _) => QuestionIndicatorWidget(
              current: value,
              total: widget.quiz.questions.length,
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.quiz.questions
            .map((question) => QuizWidget(
                  question: question,
                  onSelect: () {
                    challengeController.advanceDisabled = false;
                  },
                ))
            .toList(),
        onPageChanged: (page) {
          challengeController.advanceDisabled = true;
          if (page == (widget.quiz.questions.length - 1)) {
            challengeController.lastPage = true;
          }
          challengeController.currentQuestion = page;
        },
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ValueListenableBuilder<bool>(
              valueListenable: challengeController.lastPageNotifier,
              builder: (context, value, _) => value
                  ? ValueListenableBuilder<bool>(
                      valueListenable: challengeController.advanceDisabledNotifier,
                      builder: (context, value, _) => value
                          ? NextButtonWidget.white(
                              label: "Finalizar",
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          : NextButtonWidget.green(
                              label: "Finalizar",
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                    )
                  : ValueListenableBuilder<bool>(
                      valueListenable: challengeController.advanceDisabledNotifier,
                      builder: (context, value, _) => value
                          ? NextButtonWidget.white(
                              label: "Pular",
                              onTap: nextPage,
                            )
                          : NextButtonWidget.green(
                              label: "Avançar",
                              onTap: nextPage,
                            ),
                    )),
        ),
      ),
    );
  }
}
