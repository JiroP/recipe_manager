import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:recipe_manager/controllers/recipe_controller.dart';
import 'package:recipe_manager/widgets/add_recipe_form.dart';
import 'package:recipe_manager/widgets/statistics_screen.dart';

import 'models/data.dart';
import 'services/recipe_service.dart';

import 'widgets/recipes_screen.dart';
import 'widgets/recipe_screen.dart';
import 'widgets/home_screen.dart';
import 'widgets/favorite_recipes_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final box = await Hive.openBox("storage");

  // Load initial data when first loading the application.
  if (!box.containsKey('recipes')) {
    final initialData = recipes.map((recipe) => recipe.toJson()).toList();
    await box.put('recipes', initialData);
  }
  
  Get.lazyPut<RecipeService>(() => RecipeService());
  Get.lazyPut<RecipeController>(() => RecipeController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      defaultTransition: Transition.noTransition,
      theme: ThemeData.light(useMaterial3: true),
      getPages: [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(name: "/recipes", page: () => RecipesScreen()),
        GetPage(name: "/add-recipe", page: () => const AddRecipeScreen()),
        GetPage(name: "/recipes/:recipeId", page: () => RecipeScreen()),
        GetPage(name: "/favorites", page: () => FavoriteRecipesScreen()),
        GetPage(name: "/statistics", page: () => StatisticsScreen()),
      ],
    );
  }
}
