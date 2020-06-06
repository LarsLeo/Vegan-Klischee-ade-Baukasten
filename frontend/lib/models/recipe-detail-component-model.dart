import 'package:flutter/material.dart';

@immutable
class RecipeDetailJsonModel {
  final components;

  RecipeDetailJsonModel(this.components);
}

@immutable
class RecipeDetailComponentModel {
  final Ingredients _ingredients;
  final List<Widget> _preparation;
  final List<Widget> _nutritionValue;

  RecipeDetailComponentModel(
      this._ingredients, this._preparation, this._nutritionValue);

  factory RecipeDetailComponentModel.of(RecipeDetailJsonModel jsonModel) {
    List<Widget> tempNutritionValue = [];

    var nutritionJson = jsonModel.components["Nährwerte"];

    return RecipeDetailComponentModel(
        Ingredients(_extractMapList(jsonModel.components["Zutaten"])),
        _extractMapList(jsonModel.components["Zubereitung"]),
        tempNutritionValue);
  }

  static List<Widget> _extractMapList(ingredientJson) {
    List<Widget> tempWidgets = [];

    ingredientJson.entries.forEach((entry) {
      tempWidgets.add(ListTile(
          dense: true,
          title:
              Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold))));
      entry.value.forEach((element) =>
          tempWidgets.add(ListTile(dense: true, title: Text(element))));
    });

    return tempWidgets;
  }

  Ingredients get ingredients => _ingredients;
  List<Widget> get preparation => _preparation;
  List<Widget> get nutritionValue => _nutritionValue;
}

@immutable
class Ingredients {
  List<Widget> _ingredients;

  Ingredients(this._ingredients);

  List<Widget> get ingredients => _ingredients;

  static Ingredients of(Ingredients ingredients, int portions) {
    RegExp regExp = new RegExp(r'([\d\.]+)(.*)');

    List<Widget> newIngredients = ingredients.ingredients.map((ingredient) {
      var textData = ((ingredient as ListTile).title as Text).data;
      var matches = regExp.allMatches(textData);

      if (matches.isNotEmpty) {
        var newValue = double.parse(matches.elementAt(1).toString()) * portions;
        var newTextData = newValue.toString() + matches.elementAt(2).toString();
        return ListTile(dense: true, title: Text(newTextData));
      }
      return ingredient;
    }).toList();

    return Ingredients(newIngredients);
  }
}
