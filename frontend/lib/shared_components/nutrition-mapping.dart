import 'package:flutter/material.dart';

import 'enums.dart';

@immutable
class NutritionMapping {
  static final Map<String, NutritionProperties> _nutritionMap = {
    "kcal": NutritionProperties("", 2000, NutritionType.Makro),
    "Kohlenhydrate": NutritionProperties("g", 100, NutritionType.Makro),
    "Fett": NutritionProperties("g", 80, NutritionType.Makro),
    "Protein": NutritionProperties("g", 60, NutritionType.Makro),
    "Ballaststoffe": NutritionProperties("g", 30, NutritionType.Makro),
    "ALA": NutritionProperties("g", 1, NutritionType.Makro),
    "Lysin": NutritionProperties("mg", 800, NutritionType.Mikro),
    "Kalzium": NutritionProperties("mg", 1400, NutritionType.Mikro),
    "Zink": NutritionProperties("mg", 9, NutritionType.Mikro),
    "Eisen": NutritionProperties("mg", 10, NutritionType.Mikro),
    "B2": NutritionProperties("mg", 4, NutritionType.Mikro),
    "RÄ": NutritionProperties("mg", 2, NutritionType.Mikro),
    "Jod": NutritionProperties("\u{00B5}g", 20, NutritionType.Mikro),
    "Salz": NutritionProperties("g", 3, NutritionType.Mikro)
  };

  static NutritionProperties getNutritionUnit(String nutritionKey) {
    return _nutritionMap[nutritionKey];
  }
}

@immutable
class NutritionProperties {
  final String unit;
  final double recommendedValue;
  final NutritionType type;

  NutritionProperties(this.unit, this.recommendedValue, this.type);
}
