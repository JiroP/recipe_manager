import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Recipe {
  const Recipe(
      {required this.title,
      required this.ingredients,
      required this.instructions,
      required this.time,
      required this.id,
      this.isFavorite = false});

  final int id;
  final String title;
  final List<Ingredient> ingredients;
  final String instructions;
  final Duration time;
  final bool isFavorite;

  Map toJson() => {
        'id': id,
        'title': title,
        'instructions': instructions,
        'time': time.inMinutes,
        'ingredients': ingredients
            .map((i) => {'name': i.name, 'amount': i.amount})
            .toList(),
        'isFavorite': isFavorite
      };

  factory Recipe.fromJson(Map json) {
    return Recipe(
        id: json['id'] as int,
        title: json['title'] as String,
        instructions: json['instructions'] as String,
        time: Duration(minutes: json['time'] as int),
        isFavorite: json['isFavorite'] ?? false,
        ingredients: (json['ingredients'] as List)
            .map((i) => Ingredient(
                  name: i['name'] as String,
                  amount: i['amount'] as String,
                ))
            .toList());
  }
}

class Ingredient {
  const Ingredient({required this.name, required this.amount});

  final String name;
  final String amount;
}
