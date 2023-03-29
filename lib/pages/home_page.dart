import 'package:flutter/material.dart';
import 'package:flutter_coffee_shop/components/bottom_nav_bar.dart';
import 'package:flutter_coffee_shop/const.dart';
import 'package:flutter_coffee_shop/pages/cart_page.dart';
import 'package:flutter_coffee_shop/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //navigate bottom bar
  int _selectedIndex = 0;
  void navigatebBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    //shop page
    ShopPage(),

    //cart page
    CartPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index ) => navigatebBottomBar(index)
      ),
      body: _pages[_selectedIndex],
    );
  }
}