import 'package:flutter/material.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';

class RecipeIngredients extends StatefulWidget {
  @override
  _RecipeIngredientsState createState() => _RecipeIngredientsState();
}

class _RecipeIngredientsState extends State<RecipeIngredients> with AutomaticKeepAliveClientMixin{
  final String _key = "RecipeIngredients";

  int _portions = 1;
  Ingredients _ingredients;

  void _onDecrementClick() {
    setState(() {
      if (_portions > 1) {
        _portions -= 1;
      }
    });
  }

  void _onIncrementClick() {
    setState(() {
      _portions += 1;
      // _ingredients = Ingredients.of(_ingredients, _portions);
    });
  }

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    _ingredients = InheritedRecipeDetail.of(context).component.ingredients;

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(_key),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index == 0) {
                        return ListTile(
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: _onDecrementClick),
                              Text("Portionen: " + _portions.toString()),
                              IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: _onIncrementClick)
                            ]));
                      } else
                        return _ingredients.ingredients[index - 1];
                    },
                    childCount: _ingredients.ingredients.length + 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
