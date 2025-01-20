import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import 'screen_container.dart';
import 'recipe.dart';

class FavoriteRecipesScreen extends StatelessWidget {
  FavoriteRecipesScreen({super.key});
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
        destinationIndex: 2,
        title: "Your Favorite Recipes",
        child: Obx(() {
          final favoriteRecipes =
              controller.recipes.where((r) => r.isFavorite).toList();

          if (favoriteRecipes.isEmpty) {
            return const Center(
              child: Text(
                "You haven't added any favorites yet.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          return GridView.count(
              childAspectRatio: 3,
              padding: const EdgeInsets.all(20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount:
                  getCrossAxisCount(MediaQuery.of(context).size.width),
              children: favoriteRecipes
                  .map((r) => RecipeWidget(
                        recipe: r,
                        onDelete: () => controller.deleteRecipe(r.id),
                        onFavoriteToggle: () => controller.toggleFavorite(r),
                      ))
                  .toList());
        }));
  }
}
