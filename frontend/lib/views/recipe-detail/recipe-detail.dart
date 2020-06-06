import 'package:flutter/material.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';
import 'package:frontend/services/ingredient-service.dart';

import 'components/recipe-content/recipe-content.dart';
import 'components/recipe-header.dart';
import 'components/recipe-picture.dart';

class RecipeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: IngredientService.getRecipeDetailComponent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return new InheritedRecipeDetail(snapshot.data, new RecipeDetail());
          } else
            return CircularProgressIndicator();
        });
  }
}

class RecipeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
      return SingleChildScrollView(
          child: Wrap(
        children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: RecipePicture(),
          ),
          Container(
            alignment: Alignment.center,
            child: RecipeHeader(),
          ),
          Container(
            alignment: Alignment.center,
            child: RecipeContent(),
          )
        ],
      ));
    });
  }
}

class InheritedRecipeDetail extends InheritedWidget {
  final RecipeDetailComponentModel _component;

  InheritedRecipeDetail(this._component, Widget child) : super(child: child);

  static InheritedRecipeDetail of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedRecipeDetail>();

  RecipeDetailComponentModel get component => _component;

  @override
  bool updateShouldNotify(InheritedRecipeDetail oldWidget) =>
      oldWidget.component != component;
}
