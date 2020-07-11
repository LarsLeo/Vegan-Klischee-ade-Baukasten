import 'package:flutter/material.dart';
import 'package:frontend/shared_components/circular-progress-indicator.dart';
import 'package:frontend/views/recipe-detail/recipe-detail.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';

class RecipeNutrition extends StatelessWidget {
  final String _key = "RecipeNutritionScrollView";

  @override
  Widget build(BuildContext context) {
    List<NutritionEntity> _nutritionProgressIndicators =
        InheritedRecipeDetail.of(context).component.nutritionEntities;

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
                padding: const EdgeInsets.only(top: 50),
                sliver: SliverFixedExtentList(
                  itemExtent: 150,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      NutritionEntity entity1 =
                          _nutritionProgressIndicators[index * 2];
                      NutritionEntity entity2 =
                          _nutritionProgressIndicators[index * 2 + 1];

                      return Container(
                          height: 150,
                          child: Column(children: [
                            ListTile(
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                  CircularPercentageIndicator(entity1),
                                  CircularPercentageIndicator(entity2)
                                ])),
                            SizedBox(
                              height: 50,
                            )
                          ]));
                    },
                    childCount:
                        (_nutritionProgressIndicators.length / 2.0).ceil(),
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
