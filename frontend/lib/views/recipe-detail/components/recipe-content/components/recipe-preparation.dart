import 'package:flutter/material.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';

class RecipePreparation extends StatelessWidget {
  final String _key = "RecipePreparationKey";

  @override
  Widget build(BuildContext context) {
  List<Widget> _preparationItems = InheritedRecipeDetail.of(context).component.preparation;

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
                      return ListTile(
                          title: _preparationItems[index]
                          );
                    },
                    childCount: _preparationItems.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
