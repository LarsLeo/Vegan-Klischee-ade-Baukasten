import 'package:flutter/material.dart';
import 'package:frontend/views/recipe-detail/components/recipe-content/components/recipe-ingredients/recipe-ingredients-controller.dart';

class RecipeIngredients extends StatefulWidget {
  @override
  _RecipeIngredientsState createState() => _RecipeIngredientsState();
}

class _RecipeIngredientsState extends State<RecipeIngredients>
    with AutomaticKeepAliveClientMixin {
  final RecipeIngredientsController _controller = RecipeIngredientsController();

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    _controller.initializeWidget(context);

    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(_controller.key),
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
                                  onPressed: () =>_controller.onDecrementClick(this)),
                              Text("Portionen: " + _controller.portions.toString()),
                              IconButton( icon: Icon(Icons.add_circle_outline),
                                  onPressed: () => _controller.onIncrementClick(this))
                            ]));
                      } else if (index < _controller.ingredients.ingredients.length)
                        return _controller.ingredients.ingredients[index - 1];
                    },
                    childCount: _controller.ingredients.ingredients.length + 1,
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
