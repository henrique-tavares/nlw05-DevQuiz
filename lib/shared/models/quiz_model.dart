import 'dart:convert';

import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/question_model.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

extension LevelParserExt on String {
  Level get parseLevel => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

class QuizModel {
  final String title;
  final String icon;
  final Level level;
  final List<QuestionModel> questions;
  int correctAnswers;

  QuizModel({
    required this.title,
    required this.icon,
    required this.level,
    required this.questions,
    this.correctAnswers = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'icon': icon,
      'level': level.parse,
      'questions': questions.map((x) => x.toMap()).toList(),
      'correctAnswers': correctAnswers,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      icon: AppImages.fromString(map['icon'])!,
      level: map['level'].toString().parseLevel,
      questions: List<QuestionModel>.from(map['questions']?.map((x) => QuestionModel.fromMap(x))),
      correctAnswers: map['correctAnswers'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) => QuizModel.fromMap(json.decode(source));
}
