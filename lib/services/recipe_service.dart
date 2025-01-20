import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/models.dart';

class RecipeService {
  final storage = Hive.box("storage");

  List<Recipe> getRecipes() {
    final data = storage.get("recipes", defaultValue: []);
    return (data as List).map((json) => Recipe.fromJson(json as Map)).toList();
  }

  Recipe? getRecipeById(int id) {
    final recipes = getRecipes();
    return recipes.firstWhere((recipe) => recipe.id == id);
  }

  int get recipeCount => getRecipes().length;

  void _saveRecipes(List<Recipe> recipes) {
    final data = recipes.map((r) => r.toJson()).toList();
    storage.put("recipes", data);
  }

  void addRecipe(Recipe recipe) {
    final current = getRecipes();
    _saveRecipes([...current, recipe]);
  }

  void editRecipe(Recipe updatedRecipe) {
    final current = getRecipes();
    final index = current.indexWhere((r) => r.id == updatedRecipe.id);
    if (index != -1) {
      current[index] = updatedRecipe;
      _saveRecipes(current);
    }
  }

  void deleteRecipe(int id) {
    final current = getRecipes().where((r) => r.id != id).toList();
    _saveRecipes(current);
  }
}
