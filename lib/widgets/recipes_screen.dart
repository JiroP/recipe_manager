import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_manager/controllers/recipe_controller.dart';

import 'screen_container.dart';
import 'recipe.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({super.key});
  final controller = Get.find<RecipeController>();

  int getCrossAxisCount(double screenWidth) {
    if (screenWidth < 900) {
      return 1;
    }
    if (screenWidth < 1280) {
      return 2;
    }
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        destinationIndex: 1,
        title: "Recipes",
        child: Obx(() => GridView.count(
            childAspectRatio: 3,
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount:
                getCrossAxisCount(MediaQuery.of(context).size.width),
            children: controller.recipes
                .map((r) => RecipeWidget(
                      recipe: r,
                      onDelete: () => controller.deleteRecipe(r.id),
                      onFavoriteToggle: () => controller.toggleFavorite(r),
                    ))
                .toList())));
  }
}
