import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_shopping_cart_course/models/Food.dart';

class FoodCard extends StatelessWidget {
  final Food food;
  final Function onTap;
  final Function onDismissed;
  final bool showTrailing;
  FoodCard({this.onTap, this.food, this.onDismissed, this.showTrailing = true});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: InkWell(
          onTap: () {
            return onTap != null ? onTap(food) : null;
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListTile(
              leading: Hero(
                tag: food.id,
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.transparent,
                  child: Image.network(
                    food.image,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace stackTrace) {
                      return Icon(Icons.fastfood);
                    },
                  ),
                ),
              ),
              title: Text(food.title),
              subtitle: Text(food.restaurantChain),
              trailing: Visibility(
                visible: showTrailing,
                child: Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),
      ),
      direction: !showTrailing ? DismissDirection.horizontal : null,
      background: Container(
        color: Colors.red,
      ),
      key: ValueKey<int>(food.id),
      onDismissed: (DismissDirection direction) {
        onDismissed();
      },
    );
  }
}
