import 'package:flutter/material.dart';
import 'package:frontend/views/recipe-detail/components/recipe-content/components/recipe-nutrition/recipe-nutrition.dart';
import 'package:frontend/views/recipe-detail/components/recipe-content/components/recipe-preparation.dart';

import 'components/recipe-ingredients/recipe-ingredients.dart';

class RecipeContent extends StatelessWidget {
  final List<Widget> _tabs = [
    Tab(text: "Zutaten"),
    Tab(text: "Zubereitung"),
    Tab(text: "Nährwerte")
  ];

  // TODO: edit index 1, 2
  List<Widget> _tabViews = [
    RecipeIngredients(),
    RecipePreparation(),
    RecipeNutrition()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
      return Container(
          constraints: BoxConstraints(minHeight: 200, maxHeight: 500),
          child: DefaultTabController(
            length: _tabs.length,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      title: const Text(
                          // TODO: put text from loaded image
                          'Kichererbsen Salat'),
                      pinned: true,
                      expandedHeight: 105,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        tabs: _tabs,
                      ),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: _tabViews,
              ),
            ),
          ));
    });
  }
}
