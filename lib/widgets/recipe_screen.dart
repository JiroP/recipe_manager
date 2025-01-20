import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/recipe_controller.dart';
import 'screen_container.dart';

class RecipeScreen extends StatelessWidget {
  RecipeScreen({super.key});

  final controller = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      destinationIndex: 1,
      title: "",
      child: Obx(() {
        final recipeId = int.tryParse(Get.parameters['recipeId'] ?? '');
        if (recipeId == null) {
          return const ScreenContainer(
            destinationIndex: 1,
            child: Text("Malformatted id in url."),
          );
        }

        final recipe =
            controller.recipes.firstWhereOrNull((r) => r.id == recipeId);

        if (recipe == null) {
          return const ScreenContainer(
            destinationIndex: 1,
            child: Text("Recipe not found."),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 768),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Back",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ]),
                const SizedBox(height: 16),
                Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.grey[700]),
                    const SizedBox(width: 8),
                    Text('${recipe.time.inMinutes} minutes'),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                ...recipe.ingredients.map(
                  (ingredient) => ListTile(
                    leading: const Icon(Icons.circle, size: 10),
                    title: Text('${ingredient.amount} ${ingredient.name}'),
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Instructions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  recipe.instructions,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
