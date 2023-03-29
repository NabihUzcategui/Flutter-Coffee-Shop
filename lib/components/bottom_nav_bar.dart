// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {

  void Function(int)? onTabChange;

  
  MyBottomNavBar({
    Key? key,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorder: Border.all( color: Colors.white),
        tabBorderRadius: 24,
        tabs: const [
          
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
    
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          )
        ],
      ),
    );
  }
}
