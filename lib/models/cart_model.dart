import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    // homepage 0-3
    [
      "Burger",
      "30.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    ["Fries", "30.00", "assets/images/fries.png", Colors.orangeAccent],
    [
      "Bread Omlette",
      "30.00",
      "assets/images/bread omlette.png",
      Colors.lightGreen
    ],
    ["Sandwich", "30.00", "assets/images/sandwich.png", Colors.lightBlueAccent],
    // special 4-5
    [
      "Dahi Tikki",
      "20.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Dahi Papri",
      "20.00",
      "assets/images/a.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    // bakery 6-9
    [
      "Allo Patties",
      "16.00",
      "assets/images/a.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Paneer Patties",
      "25.00",
      "assets/images/a.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Allo Sandwich",
      "17.00",
      "assets/images/a.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Allo tikki Burger",
      "30.00",
      "assets/images/a.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    // hot drinks 10-14
    [
      "Kitchen Tea",
      "10.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],

    ["Tea Bag Tea", "10.00", "assets/images/fries.png", Colors.orangeAccent],
    [
      "Hot Coffee",
      "12.00",
      "assets/images/bread omlette.png",
      Colors.lightGreen
    ],
    [
      "Cardamom Tea",
      "13.00",
      "assets/images/sandwich.png",
      Colors.lightBlueAccent
    ],
    [
      "Lemon Tea",
      "11.00",
      "assets/images/bread omlette.png",
      Colors.lightGreen
    ],
    // cold drinks 15-21
    [
      "Any 250ml",
      "19.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Any 500ml",
      "29.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Any 100ml",
      "10.00",
      "assets/images/bread omlette.png",
      Colors.lightGreen
    ],
    [
      "Maza 500ml",
      "34.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "snacks",
      "19.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Biscuit",
      "10.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Real Juice",
      "16.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    // 22-28
    [
      "Blue Lagoon",
      "08.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Chocolate Cone",
      "25.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Vanilla Sandwich",
      "25.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Choco Treat",
      "33.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Aam",
      "21.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Kewra Kulfi",
      "17.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
    [
      "Rabri Kulfi",
      "21.00",
      "assets/images/Burger.png",
      Color.fromARGB(255, 216, 161, 110)
    ],
  ];

  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void addItemToFavourite(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void removeItemFromFavourite(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
