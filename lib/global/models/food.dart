
/// Food categories
enum FoodCategory{
  burgers,
  salads,
  sides,
  dessserts,
  drinks,
}


class Food {
  final String name;                // chesse burger
  final String description;         // a burger full of cheese
  final String imagePath;           // 'lib/images/burger.jpg'
  final double price;               // 4.99
  final FoodCategory category;      // burger
  List<Addon> availableAddons;      // [extra chesse, sauce, extra patty]
  

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons
  });

}


/// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price
  });
}
