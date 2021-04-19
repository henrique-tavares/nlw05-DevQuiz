import 'package:dev_quiz/core/app_gradients.dart';
import 'package:dev_quiz/core/core.dart';
import 'package:dev_quiz/home/widgets/score_card/score_card_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 160,
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "Olá, ",
                                style: AppTextStyles.title,
                                children: [
                                  TextSpan(
                                      text: "Henrique",
                                      style: AppTextStyles.titleBold)
                                ]),
                          ),
                          Container(
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://avatars.githubusercontent.com/u/51230543?v=4"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: ScoreCardWidget(),
                  )
                ],
              ),
            ));
}
