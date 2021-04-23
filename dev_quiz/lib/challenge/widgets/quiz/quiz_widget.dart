import 'package:dev_quiz/challenge/widgets/answer/answer_widget.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelect;

  const QuizWidget({Key? key, required this.question, required this.onSelect}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int questionSelected = -1;

  AnswerModel answer(int index) => widget.question.answers.elementAt(index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 48,
            ),
            Text(
              widget.question.title,
              style: AppTextStyles.heading,
            ),
            SizedBox(
              height: 24,
            ),
            for (var i = 0; i < widget.question.answers.length; i++)
              AnswerWidget(
                answer: answer(i),
                isSelected: questionSelected == i,
                disabled: questionSelected != -1,
                onTap: (value) {
                  questionSelected = i;
                  widget.onSelect(value);
                  setState(() {});
                },
              )
          ],
        ),
      ),
    );
  }
}
