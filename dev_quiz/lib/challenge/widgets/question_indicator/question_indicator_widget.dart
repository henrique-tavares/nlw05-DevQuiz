import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int current;
  final int total;

  const QuestionIndicatorWidget({Key? key, required this.current, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close),
                    padding: const EdgeInsets.all(0),
                    iconSize: 20,
                    color: AppColors.grey,
                    splashColor: AppColors.black.withOpacity(0.5),
                    splashRadius: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Questão ${(current + 1).toString().padLeft(2, '0')}",
                        style: AppTextStyles.body,
                      ),
                      Text(
                        "de ${total.toString().padLeft(2, '0')}",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(
              value: (current + 1) / total,
            ),
          ],
        ),
      ),
    );
  }
}
