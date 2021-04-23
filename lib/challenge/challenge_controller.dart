import 'package:flutter/material.dart';

class ChallengeController {
  final currentQuestionNotifier = ValueNotifier<int>(0);
  int get currentQuestion => currentQuestionNotifier.value;
  set currentQuestion(int value) => currentQuestionNotifier.value = value;

  final advanceDisabledNotifier = ValueNotifier<bool>(true);
  bool get advanceDisabled => advanceDisabledNotifier.value;
  set advanceDisabled(bool value) => advanceDisabledNotifier.value = value;

  final lastPageNotifier = ValueNotifier<bool>(false);
  bool get lastPage => lastPageNotifier.value;
  set lastPage(bool value) => lastPageNotifier.value = value;

  int correctAnswers = 0;
}
