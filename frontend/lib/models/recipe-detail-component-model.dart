import 'package:flutter/material.dart';
import 'package:frontend/shared_components/enums.dart';
import 'package:frontend/shared_components/nutrition-mapping.dart';

// TODO: All of this is service logic

@immutable
class RecipeDetailJsonModel {
  final components;

  RecipeDetailJsonModel(this.components);
}

@immutable
class RecipeDetailComponentModel {
  final Ingredients _ingredients;
  final List<Widget> _preparation;
  final List<NutritionEntity> _nutritionEntities;

  RecipeDetailComponentModel(
      this._ingredients, this._preparation, this._nutritionEntities);

  factory RecipeDetailComponentModel.of(RecipeDetailJsonModel jsonModel) =>
      RecipeDetailComponentModel(
          Ingredients(_extractIngredients(jsonModel.components["Zutaten"])),
          _extractPreparation(jsonModel.components["Zubereitung"]),
          _extractNutrition(jsonModel.components["Nährwerte"]));

  static List<Widget> _extractIngredients(
      Map<String, List<String>> ingredientJson) {
    List<Widget> ingredientsWidgets = [];

    ingredientJson.forEach((header, ingredients) {
      ingredientsWidgets.add(HeaderTile(header));

      ingredients.forEach((ingredient) {
        var regExp = RegExp(r"([\d\.]+)(.*)");
        var match = regExp.allMatches(ingredient).elementAt(0);
        var portions = match.group(1);
        var ingredientName = match.group(2);

        ingredientsWidgets.add(ItemTile(portions, portions, ingredientName));
      });
    });

    return ingredientsWidgets;
  }

  static List<Widget> _extractPreparation(
      Map<String, List<String>> preparationJson) {
    List<Widget> preparationWidgets = [];

    preparationJson.forEach((header, preparationSteps) {
      preparationWidgets.add(HeaderTile(header));

      preparationSteps.forEach((preparationStep) => preparationWidgets
          .add(ListTile(dense: true, title: Text(preparationStep))));
    });

    return preparationWidgets;
  }

  static List<NutritionEntity> _extractNutrition(
      Map<String, String> nutritionJson) {
    List<NutritionEntity> nutritionEntities = [];

    nutritionJson.forEach((name, value) {
      NutritionProperties properties = NutritionMapping.getNutritionUnit(name);
      nutritionEntities.add(NutritionEntity(double.parse(value),
          properties.recommendedValue, name, properties.unit, properties.type));
    });

    return nutritionEntities;
  }

  Ingredients get ingredients => _ingredients;
  List<Widget> get preparation => _preparation;
  List<NutritionEntity> get nutritionEntities => _nutritionEntities;
}

@immutable
class NutritionEntity {
  final double value;
  final double recommendedValue;
  final String name;
  final String unit;
  final NutritionType type;

  NutritionEntity(
      this.value, this.recommendedValue, this.name, this.unit, this.type);
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
        return ItemTile(
            ingredient.initialValue, currentValue.toString(), ingredient.text);
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
