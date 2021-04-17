import 'package:flutter/material.dart';
import 'package:flutter_basic_shopping_cart_course/components/FoodCard.dart';
import 'package:flutter_basic_shopping_cart_course/models/Food.dart';

class Cart extends StatefulWidget {
  final Function onPressed;
  final List<Food> cartFoods;
  Cart({this.onPressed, this.cartFoods});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Food> _cartFoods;
  void initState() {
    _cartFoods = widget.cartFoods;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Cart'),
        actions: [
          TextButton(
            onPressed: null,
            child: Text(
              _cartFoods.length.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Visibility(
        visible: _cartFoods.length > 0,
        child: ListView.builder(
          itemCount: _cartFoods.length,
          itemBuilder: (context, index) {
            return FoodCard(
              food: _cartFoods[index],
              onDismissed: () {
                widget.onPressed(_cartFoods[index]);
                setState(() {
                  _cartFoods = List.from(_cartFoods)
                    ..removeWhere((food) => food.id == _cartFoods[index].id);
                });
              },
              showTrailing: false,
            );
          },
        ),
        replacement: Center(
          child: Text('Your cart is empty'),
        ),
      ),
    );
  }
}
