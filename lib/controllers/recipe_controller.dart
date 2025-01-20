import 'package:get/get.dart';
import '../models/models.dart';
import '../services/recipe_service.dart';

class RecipeController extends GetxController {
  final _service = Get.find<RecipeService>();

  var recipes = <Recipe>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRecipes();
  }

  void loadRecipes() {
    recipes.value = _service.getRecipes();
  }

  void deleteRecipe(int id) {
    _service.deleteRecipe(id);
    loadRecipes();
  }

  void addRecipe(Recipe recipe) {
    _service.addRecipe(recipe);
    loadRecipes();
  }

  Duration get averageDuration {
    if (recipes.isEmpty) return Duration.zero;

    final totalMinutes =
        recipes.map((r) => r.time.inMinutes).reduce((a, b) => a + b);
    final averageMinutes = totalMinutes ~/ recipes.length;

    return Duration(minutes: averageMinutes);
  }

  void toggleFavorite(Recipe recipe) {
    final updated = Recipe(
      id: recipe.id,
      title: recipe.title,
      instructions: recipe.instructions,
      time: recipe.time,
      ingredients: recipe.ingredients,
      isFavorite: !recipe.isFavorite,
    );
    _service.editRecipe(updated);
    loadRecipes();
  }
}
