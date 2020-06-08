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
    // TODO: Add nutrition values
    List<Widget> tempNutritionValue = [];
    var nutritionJson = jsonModel.components["Nährwerte"];

    return RecipeDetailComponentModel(
        Ingredients(_extractIngredients(jsonModel.components["Zutaten"])),
        _extractPreparation(jsonModel.components["Zubereitung"]),
        tempNutritionValue);
  }

  static List<Widget> _extractIngredients(
      Map<String, List<String>> ingredientJson) {
    List<Widget> tempWidgets = [];

    ingredientJson.forEach((header, ingredients) {
      tempWidgets.add(HeaderTile(header));

      ingredients.forEach((ingredient) {
        var regExp = RegExp(r"([\d\.]+)(.*)");
        var match = regExp.allMatches(ingredient).elementAt(0);
        var portions = match.group(1);
        var ingredientName = match.group(2);

        tempWidgets.add(ItemTile(portions, portions, ingredientName));
      });
    });

    return tempWidgets;
  }

  static List<Widget> _extractPreparation(
      Map<String, List<String>> preparationJson) {
    List<Widget> tempWidgets = [];

    preparationJson.forEach((header, preparationSteps) {
      tempWidgets.add(HeaderTile(header));

      preparationSteps.forEach((preparationStep) =>
          tempWidgets.add(ListTile(dense: true, title: Text(preparationStep))));
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
    List<Widget> oldIngredients = ingredients.ingredients;
    var newIngredients = oldIngredients.map((ingredient) {
      if (ingredient is ItemTile) {
        var initialValue = double.parse(ingredient.initialValue);
        var currentValue = initialValue + initialValue * (portions - 1);
        return ItemTile(ingredient.initialValue, currentValue.toString(), ingredient.text);
      } else
        return ingredient;
    }).toList();

    return Ingredients(newIngredients);
  }
}

@immutable
class HeaderTile extends ListTile {
  HeaderTile(String text)
      : super(
            dense: true,
            title: Text(text, style: TextStyle(fontWeight: FontWeight.bold)));
}

@immutable
class ItemTile extends ListTile {
  final String initialValue;
  final String currentValue;
  final String text;

  ItemTile(this.initialValue, this.currentValue, this.text)
      : super(
            dense: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(currentValue), Text(text)]));
}
