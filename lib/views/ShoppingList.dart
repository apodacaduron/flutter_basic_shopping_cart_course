import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_shopping_cart_course/components/CartCounter.dart';
import 'package:flutter_basic_shopping_cart_course/components/FoodCard.dart';
import 'package:flutter_basic_shopping_cart_course/json/Foods.dart';
import 'package:flutter_basic_shopping_cart_course/models/Food.dart';
import 'package:flutter_basic_shopping_cart_course/views/Cart.dart';
import 'package:flutter_basic_shopping_cart_course/views/FoodView.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<Food> foods = [];
  List<Food> cart = [];

  @override
  void initState() {
    foods = foodsJson.map((foodJson) => Food.fromJson(foodJson)).toList();
    super.initState();
  }

  void addToCart(Food _food) {
    setState(() {
      cart = List.from(cart)..add(_food);
    });
  }

  void removeFromCart(Food _food) {
    setState(() {
      cart = List.from(cart)..removeWhere((food) => food.id == _food.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text("Shopping List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Cart(removeFromCart, cartFoods: cart),
                ),
              );
            },
            icon: CartCounter(
              count: cart.length,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return FoodCard(
            food: foods[index],
            onTap: (Food food) {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => FoodView(addToCart, food: food),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
