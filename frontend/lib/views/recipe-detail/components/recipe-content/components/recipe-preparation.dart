import 'package:flutter/material.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';

class RecipePreparation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: InheritedRecipeDetail.of(context).component.preparation
    );
  }
}
