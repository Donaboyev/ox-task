import 'dart:math';
import 'package:flutter/material.dart';

class AppColors {
  static const Color shimmerBaseDark = Color(0xFF373737);
  static const Color shimmerHighlightDark = Color(0xFF4A4A4A);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFF6F6F6F);

  static const Color greyF9 = Color(0xFFF9F9F9);
  static const Color greyF0 = Color(0xFFF0F0F0);
  static const Color greyEA = Color(0xFFEAEAEA);
  static const Color greyCF = Color(0xFFCFCFCF);
  static const Color greyBD = Color(0xFFBDBDBD);
  static const Color grey6F = Color(0xFF6F6F6F);
  static const Color transparent = Color(0x006F6F6F);

  static const Color red = Color(0xFFEB5757);
  static const Color orange = Color(0xFFFB7047);
  static const Color yellow = Color(0xFFF2C94C);
  static const Color green = Color(0xFF6FCF97);
  static const Color teal = Color(0xFF38B2AC);
  static const Color blue = Color(0xFF4993DD);
  static const Color indigo = Color(0xFF667EEA);
  static const Color purple = Color(0xFFBB6BD9);
  static const Color pink = Color(0xFFD65A78);

  static const Color primary = Color(0xFF4B5B7A);
  static const Color primaryLight = Color(0xFF617190);

  static const Color backgroundLight = Color(0xFFF1F3F5);
  static const Color cardBackgroundLight = Color(0xFFFFFFFF);

  static const Color backgroundDark = Color(0xFF404040);
  static const Color cardBackgroundDark = Color(0xFF262626);

  static const colors = const [
    purple,
    indigo,
    red,
    yellow,
    green,
    orange,
    blue,
    teal,
    pink,
    grey
  ];

  static Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
    hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static Color selectColor(List<Color> usedColors) {
    for (var color in colors) {
      if (!usedColors.contains(color)) {
        return color;
      }
    }
    return AppColors.black;
  }

  static Color getRandomColor() {
    final random = Random();
    return colors[random.nextInt(9)];
  }
}
