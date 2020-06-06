import 'package:flutter/material.dart';
import 'package:frontend/views/recipe-detail/components/recipe-content/components/recipe-preparation.dart';

import 'components/recipe-ingredients.dart';

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
    RecipeIngredients()
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewPortConstraints) {
      return Container(
          constraints: BoxConstraints(minHeight: 50, maxHeight: 500),
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
                          'Kichererbsen Salat'),
                      pinned: true,
                      expandedHeight: 150.0,
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

  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(
  //       builder: (BuildContext context, BoxConstraints viewPortConstraints) {
  //     return Container(
  //         constraints: BoxConstraints(minHeight: 50, maxHeight: 500),
  //         child: DefaultTabController(
  //           length: _tabs.length,
  //           child: NestedScrollView(
  //             headerSliverBuilder:
  //                 (BuildContext context, bool innerBoxIsScrolled) {
  //               return <Widget>[
  //                 SliverOverlapAbsorber(
  //                   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
  //                       context),
  //                   sliver: SliverAppBar(
  //                     flexibleSpace: SafeArea(
  //                         child: TabBar(
  //                       tabs: _tabs,
  //                     )),
  //                     pinned: true,
  //                     expandedHeight: 150.0,
  //                     forceElevated: innerBoxIsScrolled,
  //                   ),
  //                 ),
  //               ];
  //             },
  //             body: TabBarView(
  //               children: _tabViews,
  //             ),
  //           ),
  //         ));
  //   });
  // }
}