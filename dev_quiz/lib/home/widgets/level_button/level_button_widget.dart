import 'package:dev_quiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum LevelButtonWidgetLabel { Facil, Medio, Dificil, Perito }

class LevelButtonWidget extends StatelessWidget {
  final LevelButtonWidgetLabel label;

  LevelButtonWidget({Key? key, required this.label}) : super(key: key);

  final config = {
    LevelButtonWidgetLabel.Facil: {
      "text": "Fácil",
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    LevelButtonWidgetLabel.Medio: {
      "text": "Médio",
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    LevelButtonWidgetLabel.Dificil: {
      "text": "Difícil",
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    LevelButtonWidgetLabel.Perito: {
      "text": "Perito",
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    }
  };

  get text => config[label]!["text"]!;
  get color => config[label]!["color"]!;
  get borderColor => config[label]!["borderColor"]!;
  get fontColor => config[label]!["fontColor"]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          heightFactor: 1,
          child: Text(
            text,
            style: GoogleFonts.notoSans(
              color: fontColor,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
