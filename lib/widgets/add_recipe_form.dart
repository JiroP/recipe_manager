import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../controllers/recipe_controller.dart';
import '../widgets/screen_container.dart';
import '../models/models.dart';

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final List<Map<String, TextEditingController>> _ingredients = [];

  @override
  void initState() {
    super.initState();
    _addIngredient(); // start with one
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add({
        'name': TextEditingController(),
        'amount': TextEditingController(),
      });
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
    });
  }

  void _submit() {
    final isValid = _formKey.currentState?.saveAndValidate() ?? false;
    final hasAtLeastOneIngredient = _ingredients.any(
    (ing) =>
        ing['name']!.text.trim().isNotEmpty &&
        ing['amount']!.text.trim().isNotEmpty,
  );

  if (!isValid || !hasAtLeastOneIngredient) {
    if (!hasAtLeastOneIngredient) {
      Get.snackbar(
        "Missing Ingredient",
        "You must add at least one valid ingredient.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    return;
  }

    final values = _formKey.currentState!.value;
    final controller = Get.find<RecipeController>();
    final newId = controller.recipes.length;

    final recipe = Recipe(
      id: newId,
      title: values['title'],
      instructions: values['instructions'],
      time: Duration(minutes: int.parse(values['time'])),
      ingredients: _ingredients
          .map((pair) => Ingredient(
                name: pair['name']!.text.trim(),
                amount: pair['amount']!.text.trim(),
              ))
          .toList(),
    );

    controller.addRecipe(recipe);
    Get.toNamed('/recipes');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: "Add a new recipe",
      destinationIndex: 1,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'title',
                decoration: const InputDecoration(labelText: 'Recipe Title'),
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'instructions',
                decoration: const InputDecoration(labelText: 'Instructions'),
                maxLines: 4,
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'time',
                decoration:
                    const InputDecoration(labelText: 'Cooking Time (minutes)'),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.integer(),
                  FormBuilderValidators.min(1),
                ]),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ingredients",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 12),
              ..._ingredients.asMap().entries.map((entry) {
                final index = entry.key;
                final fields = entry.value;
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fields['name'],
                        decoration:
                            const InputDecoration(labelText: 'Ingredient'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: fields['amount'],
                        decoration: const InputDecoration(labelText: 'Amount'),
                      ),
                    ),
                    IconButton(
                      onPressed: () => _removeIngredient(index),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _addIngredient,
                icon: const Icon(Icons.add),
                label: const Text("Add Ingredient"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text("Save Recipe"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
