import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/components/coffee_tile.dart';
import 'package:flutter_coffee_shop/models/coffee.dart';
import 'package:flutter_coffee_shop/models/coffee_shop.dart';
import 'package:provider/provider.dart';



class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {


  //add to cart
  void addToCart(Coffee coffee) {

    //add to cart
    Provider.of<CoffeeShop>(context, listen: false).addItemToCar(coffee);

    //let user khow it add benn successfully added
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),        
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Text('How would you like your coffee?', style: TextStyle( fontSize: 20),),

            const SizedBox( height: 25,),

            Expanded(
              child: ListView.builder(
                itemCount: value.coffeeShop.length,
                itemBuilder: (context, index) {
                  //get  individual coffee
                  Coffee eachCoffee = value.coffeeShop[index];

                  //retunr thi tile for this coffee
                  return CoffeeTile(
                    icon: const Icon(Icons.add),
                    coffee: eachCoffee,
                    onPressed: () => addToCart(eachCoffee),
                  );                 
                },
              )
            )
          ],
        ),
      )
    ),
    );
  }
}