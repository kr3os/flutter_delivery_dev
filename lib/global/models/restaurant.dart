
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:delivery_app/global/models/cart_item.dart';
import 'package:delivery_app/global/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

  // List of food menu
  final List<Food> _menu = [
    /// Burgers
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.burgers,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.burgers,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.burgers,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.burgers,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.burgers,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),

    /// Salads
    Food(
      name: 'Salades', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.salads,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),

    /// Sided
    Food(
      name: 'Frecnh Fries', 
      description: 'The traditional and required french fried with parmesado and trufga', 
      imagePath: 'assets/images/sides/f1.jpg', 
      price: 4.99, 
      category: FoodCategory.sides,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'catsup', price: 1.0),
        Addon(name: 'pickles', price: 1.99),
       ]
    ),
    Food(
      name: 'Holy Nachos', 
      description: 'Iresitible Nachos with guacamole', 
      imagePath: 'assets/images/sides/n1.jpg', 
      price: 4.99, 
      category: FoodCategory.sides,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'catsup', price: 1.0),
        Addon(name: 'pickles', price: 1.99),
       ]
    ),
    Food(
      name: 'Frecnh Fries', 
      description: 'The traditional and required french fried with parmesado and trufga', 
      imagePath: 'assets/images/sides/f1.jpg', 
      price: 4.99, 
      category: FoodCategory.sides,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'catsup', price: 1.0),
        Addon(name: 'pickles', price: 1.99),
       ]
    ),
    
    /// Desserts
    Food(
      name: 'Tiramisu', 
      description: 'The classic and best Tiramisu recipy', 
      imagePath: 'assets/images/desserts/t1.jpg', 
      price: 3.33, 
      category: FoodCategory.dessserts,
       availableAddons: [
        Addon(name: 'Berries', price: 0.99),
        Addon(name: 'Coffe', price: 1.0),
       ]
    ),
    Food(
      name: 'Croassant', 
      description: 'A delisious buttery corassant melted in choclate', 
      imagePath: 'assets/images/desserts/c1.jpg', 
      price: 3.33, 
      category: FoodCategory.dessserts,
       availableAddons: [
        Addon(name: 'Chocolate', price: 0.99),
        Addon(name: 'Butter', price: 1.0),
       ]
    ),
    Food(
      name: 'Ice Cream', 
      description: 'Ice cream with 0 sugar, vainilla', 
      imagePath: 'assets/images/desserts/i1.jpg', 
      price: 3.33, 
      category: FoodCategory.dessserts,
       availableAddons: [
        Addon(name: 'Extra', price: 0.99),
       ]
    ),

    /// Drinks
    Food(
      name: 'Chesse Burger', 
      description: 'A jucy beff patty wioth melted cheddar. lettuce. tomato, and a hint of aonin and picke', 
      imagePath: 'assets/images/burgers/b1.jpg', 
      price: 4.99, 
      category: FoodCategory.drinks,
       availableAddons: [
        Addon(name: 'Extra cheese', price: 0.99),
        Addon(name: 'Bacon', price: 1.0),
        Addon(name: 'Avocado', price: 1.99),
       ]
    ),

  ];


  /// User cart
  final List<CartItem> _cart = [];

  /// delivery agress (which user can change/update)
  String _deliveryAdress = 'El Refugio Qro';

  /// GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAdress => _deliveryAdress;
  
  /// OPERATIONS
  
  

  // ad to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    // See if there is a cart item alrady with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;
      // check if the list of selected addons are the same
      bool isSameAddons = const ListEquality().equals(item.selectedAddons, selectedAddons);
   
      return isSameFood && isSameAddons;

    });
    // if item alrady exist, increase it's quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // Otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons
        )
      );
    }
    notifyListeners();

  }

  // remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      // Grather than 1
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
    
  }

  // get toal number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAdress = newAddress;
    notifyListeners();
  }

  /// HELPERS

  // generate a recipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    // format the date to includ eup to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAdress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price) {
    return "\$${price.toString()}";
  }

  // format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => 
      "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }

}