import 'package:flutter/material.dart';

import 'widgets/statistics_screen.dart';
import 'widgets/recipes_screen.dart';
import 'widgets/favorite_recipes_screen.dart';
import 'widgets/home_screen.dart';

class Destination {
  const Destination(this.icon, this.label, this.route, this.screen);
  final IconData icon;
  final String label;
  final String route;
  final Widget Function() screen;
}

List<Destination> destinations = <Destination>[
  Destination(Icons.home, 'Home', '/', () => HomeScreen()),
  Destination(Icons.food_bank, 'Recipes', '/recipes', () => RecipesScreen()),
  Destination(Icons.favorite, 'Favorites', '/favorites', () => FavoriteRecipesScreen()),
  Destination(Icons.bar_chart, 'Statistics', '/statistics', () => StatisticsScreen()),
];