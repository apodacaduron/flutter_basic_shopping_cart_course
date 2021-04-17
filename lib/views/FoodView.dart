import 'package:flutter/material.dart';
import 'package:flutter_basic_shopping_cart_course/models/Food.dart';

class FoodView extends StatelessWidget {
  final Food food;
  final bool inCart;
  final Function onPressed;
  FoodView({this.onPressed, this.food, this.inCart = false});

  void _addFoodToCart(context) {
    onPressed(food);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(food.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: food.id,
              child: Image.network(
                food.image,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace stackTrace) {
                  return Icon(Icons.fastfood);
                },
              ),
            ),
            ListTile(
              title: Text(food.title),
              subtitle:
                  Text('${food.restaurantChain} / ${food.readableServingSize}'),
            ),
            Container(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: !inCart ? () => _addFoodToCart(context) : null,
                child: Text('Add to cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
