import 'package:frontend/models/recipe-detail-component-model.dart';

class IngredientService {
  // TODO: replace with firebase json mapping
  static final RecipeDetailJsonModel _dummyComponent = RecipeDetailJsonModel({
    "Zutaten": {
      "Linsenteil": ["1 kg Linsen", "1.5 TL Erbsen", "0.5 EL Öl"],
      "Salatteil": [
        "2 kg Blattsalat",
        "5 EL Öl",
        "10 Bananen",
        "20 TL Kurkuma",
        "204 Äpfel",
        "2 kg Blattsalat",
        "5 EL Öl",
        "10 Bananen",
        "20 TL Kurkuma",
        "204 Äpfel"
      ]
    },
    "Zubereitung": {
      "Linsenteil": [
        "Linsen und Erbsen waschen",
        "Linsen 5 Minuten im Mittelgroßen Topf köcheln",
        "Erbsen hinzufügen und weitere 10 Minuten kochen",
        "Mit Öl übergießen",
        "Am Ende einweichen",
        "Bestes Rezept der Welt!"
      ]
    },
    "Nährwerte": {"Selen": "10 mg", "Eisen": "200 kg"}
  });

  static Future<RecipeDetailComponentModel> getRecipeDetailComponent() async {
    return await Future.delayed(Duration(seconds: 0),
        () => RecipeDetailComponentModel.of(_dummyComponent));
  }
}
