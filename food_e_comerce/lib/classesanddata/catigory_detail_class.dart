enum Sizes {
  small,
  medium,
  large
}

class CatigoryDetailClass {
  String id;
  String catigory;
  String image;
  String title;
  String ingredients;
  Sizes size;
  String extra;
  String price;
  int calories;
  double rating;
  List<String> reviews;
  List<String> allergens;
  List<String> tags;
  Duration preparationTime;
  Duration cookingTime;

  CatigoryDetailClass({
    required this.id,
    required this.catigory,
    required this.image,
    required this.title,
    required this.ingredients,
    required this.size,
    required this.extra,
    required this.price,
    this.calories = 0,
    this.rating = 0.0,
    this.reviews = const [],
    this.allergens = const [],
    this.tags = const [],
    this.preparationTime = const Duration(minutes: 0),
    this.cookingTime = const Duration(minutes: 0),
  });
}
