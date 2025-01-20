import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class RecipeWidget extends StatelessWidget {
  const RecipeWidget(
      {super.key,
      required this.recipe,
      required this.onFavoriteToggle,
      required this.onDelete});

  final Recipe recipe;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onDelete;

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Recipe"),
        content: const Text("Are you sure you want to delete this recipe?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete();
              Get.snackbar("Deleted", "${recipe.title} was removed",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        leading: CircleAvatar(
          backgroundColor: Colors.redAccent,
          child: Text(
            recipe.title[0], // First letter of the title
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          recipe.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'Cooking time: ${recipe.time.inMinutes} mins\n'
          'Ingredients: ${recipe.ingredients.length}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(
              icon: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: recipe.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: onFavoriteToggle,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.grey),
              onPressed: () => _confirmDelete(context),
            ),
          ],
        ),
        onTap: () => Get.toNamed("/recipes/${recipe.id}"),
      ),
    );
  }
}
