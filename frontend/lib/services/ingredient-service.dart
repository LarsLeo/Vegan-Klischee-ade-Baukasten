import 'package:frontend/dummy-data.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';

class IngredientService {
  static Future<RecipeDetailComponentModel> getRecipeDetailComponent() async {
    return await Future.delayed(Duration(seconds: 0),
        () => RecipeDetailComponentModel.of(DummyData.dummyComponent));
  }
}
