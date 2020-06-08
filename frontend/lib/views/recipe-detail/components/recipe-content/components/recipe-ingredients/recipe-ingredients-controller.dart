import 'package:flutter/material.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';

class RecipeIngredientsController {
  final String key = "RecipeIngredients";
  int portions = 1;
  Ingredients ingredients;

  void initializeWidget(BuildContext context) {
    if (ingredients == null)
      ingredients = InheritedRecipeDetail.of(context).component.ingredients;
  }

  void onDecrementClick(State state) {
    state.setState(() {
      if (portions > 1) {
        portions -= 1;
        ingredients = Ingredients.of(ingredients, portions);
      }
    });
  }

  void onIncrementClick(State state) {
    state.setState(() {
      portions += 1;
      ingredients = Ingredients.of(ingredients, portions);
    });
  }
}
