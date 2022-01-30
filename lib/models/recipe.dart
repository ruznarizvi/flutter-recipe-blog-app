class Recipe {
  String? id;
  String? name;
  String? category;
  String? preparationtime;
  String? instructions;
  String? recipeimage;
  List? ingredients;
  List? favourites;

  Recipe(
      {this.id,
      this.name,
      this.category,
      this.preparationtime,
      this.instructions,
      this.recipeimage,
      this.ingredients,
      this.favourites});

  //convert object to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'preparationtime': preparationtime,
        'instructions': instructions,
        'ingredients': ingredients,
        'recipeimage': recipeimage,
        'favourites': favourites,
      };

  //returns user object
  static Recipe fromJson(Map<String, dynamic> json) => Recipe(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        preparationtime: json['preparationtime'],
        instructions: json['instructions'],
        ingredients: json['ingredients'],
        recipeimage: json['recipeimage'],
        favourites: json['favourites'],
      );
}
