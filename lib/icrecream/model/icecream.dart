import 'dart:convert';

class Icecream {
  final String flavor;
  final String description;
  final List<String> toppings;
  final double price;
  final String image;
  final List<Ingredient> ingredients;

  Icecream({
    required this.flavor,
    required this.description,
    required this.toppings,
    required this.price,
    required this.image,
    required this.ingredients,
  });

  factory Icecream.fromJson(Map<String, dynamic> json) {
    var toppingsList = json['toppings'].cast<String>();
    var ingredientsList = (json['ingredients'] as List)
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();

    return Icecream(
      flavor: json['flavor'],
      description: json['description'],
      toppings: toppingsList,
      price: json['price'].toDouble(),
      image: json['image'],
      ingredients: ingredientsList,
    );
  }
}

class Ingredient {
  final String name;
  final String quantity;

  Ingredient({required this.name, required this.quantity});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}

class IcecreamList {
  final List<Icecream> icecreams;

  IcecreamList({required this.icecreams});

  factory IcecreamList.fromJson(String jsonString) {
    List<dynamic> jsonList = json.decode(jsonString)['icecreams'];
    List<Icecream> icecreams =
        jsonList.map((icecream) => Icecream.fromJson(icecream)).toList();
    return IcecreamList(icecreams: icecreams);
  }
}
