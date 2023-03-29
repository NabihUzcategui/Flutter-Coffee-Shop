import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{

  //coffee for sale list
  final List<Coffee> _shop = [

    //black coffee
    Coffee(
      name: 'Black Coffee',
      price: '3,50',
      imagePath: 'assets/hot-coffee-1.png',
    ),

    //latte
    Coffee(
      name: 'Latte',
      price: '5,50',
      imagePath: 'assets/coffee.png',
    ),

    //expresso
    Coffee(
      name: 'Expresso',
      price: '4,99',
      imagePath: 'assets/coffee-pot.png',
    ),

    //iced coffee
    Coffee(
      name: 'Iced Coffee',
      price: '6,50',
      imagePath: 'assets/coffee-cup.png',
    ),

  ];


  //user cart
  final List<Coffee> _userCart = [];

  //get coffee list
  List<Coffee> get coffeeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToCar(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCar(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
  

}