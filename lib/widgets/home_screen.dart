import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import 'screen_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final controller = Get.find<RecipeController>();

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
        destinationIndex: 0,
        title: 'Home Page',
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 768),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to the RecipeManager!",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Here's how to use the RecipeManager:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                const Text(
                  "• Add and edit your own recipes (by deleting and adding a new one!)\n"
                  "• Favorite recipes for easy access\n"
                  "• Look at your statistics!\n"
                  "Note that the recipe manager comes with a set of preinstalled recipes, but you can delete them.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.toNamed("/recipes"),
                  child: const Text("Start browsing recipes"),
                ),
              ],
            ),
          ),
        ));
  }
}
