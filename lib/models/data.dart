import 'models.dart';

final List<Recipe> recipes = [
  const Recipe(
    id: 0,
    title: "Spaghetti Bolognese",
    ingredients: [
      Ingredient(name: "Spaghetti", amount: "250g"),
      Ingredient(name: "Minced Beef", amount: "300g"),
      Ingredient(name: "Tomato Sauce", amount: "2dl"),
      Ingredient(name: "Onion", amount: "1 pc"),
      Ingredient(name: "Garlic", amount: "2 cloves"),
    ],
    instructions:
        "Cook spaghetti. Fry beef, onion, and garlic. Mix with sauce. Serve.",
    time: Duration(minutes: 30),
  ),
  const Recipe(
    id: 1,
    title: "Pancakes",
    ingredients: [
      Ingredient(name: "Flour", amount: "200g"),
      Ingredient(name: "Milk", amount: "3dl"),
      Ingredient(name: "Egg", amount: "2 pcs"),
      Ingredient(name: "Sugar", amount: "50g"),
    ],
    instructions: "Mix ingredients, cook in a pan, and enjoy.",
    time: Duration(minutes: 20),
  ),
  const Recipe(
    id: 2,
    title: "Chicken Curry",
    ingredients: [
      Ingredient(name: "Chicken Breast", amount: "300g"),
      Ingredient(name: "Coconut Milk", amount: "2dl"),
      Ingredient(name: "Curry Paste", amount: "2 tbsp"),
      Ingredient(name: "Vegetables", amount: "150g"),
    ],
    instructions:
        "Cook chicken and vegetables. Add coconut milk and curry paste. Simmer and serve.",
    time: Duration(minutes: 40),
  ),
  const Recipe(
    id: 3,
    title: "Caesar Salad",
    ingredients: [
      Ingredient(name: "Lettuce", amount: "1 head"),
      Ingredient(name: "Croutons", amount: "100g"),
      Ingredient(name: "Caesar Dressing", amount: "50g"),
      Ingredient(name: "Parmesan Cheese", amount: "30g"),
    ],
    instructions: "Mix all ingredients in a bowl and serve.",
    time: Duration(minutes: 10),
  ),
  const Recipe(
    id: 4,
    title: "Beef Tacos",
    ingredients: [
      Ingredient(name: "Taco Shells", amount: "6 pcs"),
      Ingredient(name: "Ground Beef", amount: "300g"),
      Ingredient(name: "Cheese", amount: "100g"),
      Ingredient(name: "Lettuce", amount: "50g"),
      Ingredient(name: "Tomato", amount: "2 pcs"),
    ],
    instructions: "Cook beef. Fill shells with beef, cheese, and vegetables.",
    time: Duration(minutes: 25),
  ),
  const Recipe(
    id: 5,
    title: "Vegetable Stir Fry",
    ingredients: [
      Ingredient(name: "Mixed Vegetables", amount: "300g"),
      Ingredient(name: "Soy Sauce", amount: "0.5dl"),
      Ingredient(name: "Garlic", amount: "2 cloves"),
      Ingredient(name: "Ginger", amount: "1 tbsp"),
    ],
    instructions: "Stir fry vegetables with garlic, ginger, and soy sauce.",
    time: Duration(minutes: 15),
  ),
  const Recipe(
    id: 6,
    title: "Chocolate Cake",
    ingredients: [
      Ingredient(name: "Flour", amount: "250g"),
      Ingredient(name: "Sugar", amount: "200g"),
      Ingredient(name: "Cocoa Powder", amount: "50g"),
      Ingredient(name: "Eggs", amount: "3 pcs"),
      Ingredient(name: "Butter", amount: "100g"),
    ],
    instructions: "Mix and bake ingredients at 180°C for 30 minutes.",
    time: Duration(minutes: 60),
  ),
  const Recipe(
    id: 7,
    title: "Tomato Soup",
    ingredients: [
      Ingredient(name: "Tomatoes", amount: "500g"),
      Ingredient(name: "Onion", amount: "1 pc"),
      Ingredient(name: "Garlic", amount: "2 cloves"),
      Ingredient(name: "Vegetable Stock", amount: "5dl"),
    ],
    instructions: "Cook tomatoes, onion, and garlic. Blend and add stock.",
    time: Duration(minutes: 30),
  ),
  const Recipe(
    id: 8,
    title: "Grilled Cheese Sandwich",
    ingredients: [
      Ingredient(name: "Bread", amount: "2 slices"),
      Ingredient(name: "Cheese", amount: "2 slices"),
      Ingredient(name: "Butter", amount: "10g"),
    ],
    instructions: "Butter bread, add cheese, and grill until golden brown.",
    time: Duration(minutes: 10),
  ),
  const Recipe(
    id: 9,
    title: "Banana Smoothie",
    ingredients: [
      Ingredient(name: "Banana", amount: "2 pcs"),
      Ingredient(name: "Milk", amount: "3dl"),
      Ingredient(name: "Honey", amount: "1 tbsp"),
    ],
    instructions: "Blend all ingredients until smooth.",
    time: Duration(minutes: 5),
  ),
];
