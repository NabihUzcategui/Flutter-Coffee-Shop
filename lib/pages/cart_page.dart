import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/components/coffee_tile.dart';
import 'package:flutter_coffee_shop/models/coffee.dart';
import 'package:flutter_coffee_shop/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCar(coffee);
  }


  void payNow() {
    /*
    fill you payment service here
    */
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [

            //heading
            const Text('Your Cart'),

            //list of cart
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (BuildContext context, int index) {

                //get individual cart items
                Coffee eachCoffee = value.userCart[index];

                //return coffee tile
                return CoffeeTile(
                  coffee: eachCoffee, 
                  icon: const Icon(Icons.delete),
                  onPressed: () =>  removeFromCart(eachCoffee),
                );
              },) 
            ),

            //pay bouttom
            GestureDetector(
              onTap: payNow,
              child: Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: const Text('Pay Now', style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}