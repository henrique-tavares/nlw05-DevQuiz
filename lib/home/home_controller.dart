import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

enum HomeState {
  success,
  error,
  loading,
  empty,
}

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  late UserModel user;
  late List<QuizModel> quizzes;

  final repository = HomeRepository();

  void loadData() async {
    state = HomeState.loading;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
