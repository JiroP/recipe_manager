import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import 'screen_container.dart';

class StatisticsScreen extends StatelessWidget {
  StatisticsScreen({super.key});

  final controller = Get.find<RecipeController>();

  Duration get averageDuration {
    if (controller.recipes.isEmpty) return Duration.zero;
    final totalMinutes = controller.recipes
        .map((r) => r.time.inMinutes)
        .reduce((a, b) => a + b);
    return Duration(minutes: totalMinutes ~/ controller.recipes.length);
  }

  int get totalIngredients {
    return controller.recipes
        .map((r) => r.ingredients.length)
        .fold(0, (a, b) => a + b);
  }

  Map<String, int> get ingredientFrequency {
    final map = <String, int>{};
    for (final recipe in controller.recipes) {
      for (final ingredient in recipe.ingredients) {
        map[ingredient.name] = (map[ingredient.name] ?? 0) + 1;
      }
    }
    return map;
  }

  String get mostUsedIngredient {
    final sorted = ingredientFrequency.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sorted.isNotEmpty ? sorted.first.key : "None";
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Recipe Statistics",
      destinationIndex: 3,
      child: Obx(() {
        final recipes = controller.recipes;
        final favoriteCount = recipes.where((r) => r.isFavorite).length;
        final averageTime = averageDuration.inMinutes;

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            _statTile("Total Recipes", recipes.length.toString()),
            _statTile("Favorite Recipes", favoriteCount.toString()),
            _statTile("Average Cooking Time", "$averageTime min"),
            _statTile("Total Ingredients", totalIngredients.toString()),
            _statTile("Most Used Ingredient", mostUsedIngredient),
          ],
        );
      }),
    );
  }

  Widget _statTile(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}